source ./random.sh
codes=(200 201 400 401 403 404 500 501 502 503)
methods=("GET" "POST" "PUT" "PATCH" "DELETE")
url=("ya.ru" "rambler.ru" "yahoo.com" "google.com" "dom2.ru" "cisco.com")
urlword=("category" "count" "date" "ship" "word" "cabinet")
agents=("Mozilla" "Google" "Chrome" "Opera" "Safari" "IE" "Microsoft Edge" "Crawler")

make_log_str () {
		echo "`random 0 256`.`random 0 256`.`random 0 256`.`random 0 254` ${codes[`random 0 10`]} ${methods[`random 0 5`]} [`date '+%d/%m/%Y:%H:%M:%S'`] \"http://${url[`random 0 6`]}/${urlword[`random 0 6`]}/${urlword[`random 0 6`]}\" \"${agents[`random 0 8`]}\""
}
