ndir=`ls -lR $1 | grep "^d" | wc -l`
listdir=`du -h $1 | sort -nr`
nfiles=`ls -lR $1 | grep "^-" | wc -l`
nconffiles=`ls -lR $1 | grep ".conf$" | wc -l`
ntxtfiles=`ls -lR $1 | grep ".txt$" | wc -l`
nexefiles=`find $1 -executable -type f | wc -l`
nlogfiles=`ls -lR $1 | grep ".log$" | wc -l`
archext=( .zip .tar .gz .rar )
narchfiles=0
listfiles=`find $1 -type f -exec wc -c \{\} \; | sort -nrk1`
for (( i = 0; i < ${#archext[@]}; i++ ))
do 
	n=`ls -lR $1 | grep "${archext[i]}$" | wc -l`
	narchfiles=$(($narchfiles+$n))	
done
nsymlinks=`ls -lR $1 | grep "^l" | wc -l`
listexefiles=`find $1 -executable -type f -exec wc -c \{\} \; | sort -nrk1`
echo "Total number of folders (including all nested ones) = $ndir"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
for (( i = 1; i <= 5; i++ ))
do	
	if [[ $i -gt $ndir ]]
	then
		echo "$i - empty"
	else
		echo "$i - `echo "$listdir" | head -n $(($i+1)) | tail -n 1 | awk '{print $2 ", " $1"B"}'`"
	fi
done
echo "Total number of files = $nfiles"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $nconffiles"
echo "Text files = $ntxtfiles"
echo "Executable files = $nexefiles"
echo "Log files (with the extension .log) = $nlogfiles"
echo "Archive files = $narchfiles"
echo "Symbolic links = $nsymlinks"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for (( i = 1; i <= 10; i++ ))
do
	if [[ $i -gt $nfiles ]]
	then
		echo "$i - empty"
	else
		echo "$i - `echo "$listfiles" | head -n $i | tail -n 1 | awk '{print $2 ", " $1"B,"}'` `echo "$listfiles" | head -n $i | tail -n 1 | grep -o '\.[a-z]\+$'`"
	fi
done
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
for (( i = 1; i <= 10; i++ ))
do
	filename=`echo "$listexefiles" | head -n $i | tail -n 1 | awk '{print $2}'`
	if [[ $i -gt $nexefiles ]]
	then
		echo "$i - empty"
	else
		echo "$i - `echo "$listexefiles" | head -n $i | tail -n 1 | awk '{print $2 ", " $1"B,"}'` `md5sum $filename | awk '{print $1}'`"
	fi
done
