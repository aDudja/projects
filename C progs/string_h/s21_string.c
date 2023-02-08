#include "s21_string.h"

//                                                                        First Part (FUNCTIONS)

void* s21_memchr(const void *str, int c, s21_size_t n) {
  void* result = s21_NULL;
  if (n != 0) {
    const char *p = str;
    do {
      if (*p++ == (char)c) {
        result = ((void *)(p - 1));
        break;
      }
    } while (--n != 0);
  }
  return result;
}

int s21_memcmp(const void* s1, const void* s2, s21_size_t n) {
  const unsigned char *p1 = s1, *p2 = s2;
  int result = 0;
  while (n--)
    if (*p1 != *p2) {
      result = *p1 - *p2;
    } else {
      p1++;
      p2++;
    }
  return result;
}


void* s21_memcpy(void *dest, const void *src, s21_size_t n) {
  char* d = dest;
  const char* s = src;
  while (n-- > 0) {
    *d++ = *s++;
  }
  return dest;
}

void *s21_memmove(void *dest, const void *src, s21_size_t n) {
  char* d = dest;
  char* s = (char*)src;
  if (d < s) {
    while (n--) {
      *d++ = *s++;
      }
    } else {
        char* ends = s + (n - 1);
        char* endd = d + (n - 1);
          while (n--) {
            *endd-- = *ends--;
          }
        }
  return dest;
}

void *s21_memset(void *str, int c, s21_size_t n) {
  char *p = (char *)str;
  for (s21_size_t i = 0; i != n; ++i) {
    p[i] = c;
  }
  return str;
}

char *s21_strcat(char *dest, const char *src) {
  char *tmp = dest;
  while (*dest) {
    dest++;
  }
  while ((*dest++ = *src++) != '\0') {}
  return tmp;
}

char *s21_strncat(char *dest, const char *src, s21_size_t n) {
  s21_size_t dest_len = s21_strlen(dest);
  s21_size_t i;
  for (i = 0 ; i < n && src[i] != '\0' ; i++) {
    dest[dest_len + i] = src[i];
  }
  dest[dest_len + i] = '\0';
  return dest;
}

char *s21_strchr(const char *str, int c) {
  int is_null = 0;
  for (; *str != (char)c; ++str) {
    if (*str == '\0') {
      is_null = 1;
      break;
      }
  }
  char *result = s21_NULL;
  if (is_null == 0) {
    result = (char *)str;
  }
  return result;
}

int s21_strcmp(const char *str1, const char *str2) {
  while (*str1 && *str1 == *str2) {
    ++str1;
    ++str2;
  }
  return (*str1 - *str2);
}

int s21_strncmp(const char *str1, const char *str2, s21_size_t n) {
  int resultcmp = 0;
    for (s21_size_t i = 0; i < n; i++) {
      if (str1[i] > str2[i] || str2[i] > str1[i]) {
        resultcmp = str1[i] - str2[i];
        break;
      } else if (str1[i] == '\0' || str2[i] == '\0') {
          break;
        }
    }
  return resultcmp;
}

char *s21_strcpy(char *dest, const char *src) {
  int i = 0;
  while (src[i] != '\0') {
    dest[i] = src[i];
    i++;
  }
    dest[i] = '\0';
  return dest;
}

char *s21_strncpy(char *dest, const char *src, s21_size_t n) {
    s21_size_t stringlen = s21_strnlen(src, n);
        if (stringlen != n) {
                s21_memset(dest+stringlen, '\0', n - stringlen);
        }
    return s21_memcpy(dest, src, stringlen);
}

s21_size_t s21_strcspn(const char *str1, const char *str2) {
  int i = 0;
  while (str1[i] != '\0') {
    if (s21_strchr(str2, str1[i]) != s21_NULL) {
      break;
    }
    i++;
  }
  s21_size_t lenght = i * sizeof(char);
  return lenght;
}

char *s21_strerror(int errnum) {
#ifdef __APPLE__
  char errlist[107][50] = {
    "Undefined error: 0",
    "Operation not permitted",
    "No such file or directory",
    "No such process",
    "Interrupted system call",
    "Input/output error",
    "Device not configured",
    "Argument list too long",
    "Exec format error",
    "Bad file descriptor",
    "No child processes",
    "Resource deadlock avoided",
    "Cannot allocate memory",
    "Permission denied",
    "Bad address",
    "Block device required",
    "Resource busy",
    "File exists",
    "Cross-device link",
    "Operation not supported by device",
    "Not a directory",
    "Is a directory",
    "Invalid argument",
    "Too many open files in system",
    "Too many open files",
    "Inappropriate ioctl for device",
    "Text file busy",
    "File too large",
    "No space left on device",
    "Illegal seek",
    "Read-only file system",
    "Too many links",
    "Broken pipe",
    "Numerical argument out of domain",
    "Result too large",
    "Resource temporarily unavailable",
    "Operation now in progress",
    "Operation already in progress",
    "Socket operation on non-socket",
    "Destination address required",
    "Message too long",
    "Protocol wrong type for socket",
    "Protocol not available",
    "Protocol not supported",
    "Socket type not supported",
    "Operation not supported",
    "Protocol family not supported",
    "Address family not supported by protocol family",
    "Address already in use",
    "Can't assign requested address",
    "Network is down",
    "Network is unreachable",
    "Network dropped connection on reset",
    "Software caused connection abort",
    "Connection reset by peer",
    "No buffer space available",
    "Socket is already connected",
    "Socket is not connected",
    "Can't send after socket shutdown",
    "Too many references: can't splice",
    "Operation timed out",
    "Connection refused",
    "Too many levels of symbolic links",
    "File name too long",
    "Host is down",
    "No route to host",
    "Directory not empty",
    "Too many processes",
    "Too many users",
    "Disc quota exceeded",
    "Stale NFS file handle",
    "Too many levels of remote in path",
    "RPC struct is bad",
    "RPC version wrong",
    "RPC prog. not avail",
    "Program version wrong",
    "Bad procedure for program",
    "No locks available",
    "Function not implemented",
    "Inappropriate file type or format",
    "Authentication error",
    "Need authenticator",
    "Device power is off",
    "Device error",
    "Value too large to be stored in data type",
    "Bad executable (or shared library)",
    "Bad CPU type in executable",
    "Shared library version mismatch",
    "Malformed Mach-o file",
    "Operation canceled",
    "Identifier removed",
    "No message of desired type",
    "Illegal byte sequence",
    "Attribute not found",
    "Bad message",
    "EMULTIHOP (Reserved)",
    "No message available on STREAM",
    "ENOLINK (Reserved)",
    "No STREAM resources",
    "Not a STREAM",
    "Protocol error",
    "STREAM ioctl timeout",
    "Operation not supported on socket",
    "Policy not found",
    "State not recoverable",
    "Previous owner died",
    "Interface output queue is full",
  };
#endif  // __APPLE__

#ifdef __linux__
  char errlist[134][50] = {
    "Success",
    "Operation not permitted",
    "No such file or directory",
    "No such process",
    "Interrupted system call",
    "Input/output error",
    "No such device or address",
    "Argument list too long",
    "Exec format error",
    "Bad file descriptor",
    "No child processes",
    "Resource temporarily unavailable",
    "Cannot allocate memory",
    "Permission denied",
    "Bad address",
    "Block device required",
    "Device or resource busy",
    "File exists",
    "Invalid cross-device link",
    "No such device",
    "Not a directory",
    "Is a directory",
    "Invalid argument",
    "Too many open files in system",
    "Too many open files",
    "Inappropriate ioctl for device",
    "Text file busy",
    "File too large",
    "No space left on device",
    "Illegal seek",
    "Read-only file system",
    "Too many links",
    "Broken pipe",
    "Numerical argument out of domain",
    "Numerical result out of range",
    "Resource deadlock avoided",
    "File name too long",
    "No locks available",
    "Function not implemented",
    "Directory not empty",
    "Too many levels of symbolic links",
    "Unknown error 41",
    "No message of desired type",
    "Identifier removed",
    "Channel number out of range",
    "Level 2 not synchronized",
    "Level 3 halted",
    "Level 3 reset",
    "Link number out of range",
    "Protocol driver not attached",
    "No CSI structure available",
    "Level 2 halted",
    "Invalid exchange",
    "Invalid request descriptor",
    "Exchange full",
    "No anode",
    "Invalid request code",
    "Invalid slot",
    "Unknown error 58",
    "Bad font file format",
    "Device not a stream",
    "No data available",
    "Timer expired",
    "Out of streams resources",
    "Machine is not on the network",
    "Package not installed",
    "Object is remote",
    "Link has been severed",
    "Advertise error",
    "Srmount error",
    "Communication error on send",
    "Protocol error",
    "Multihop attempted",
    "RFS specific error",
    "Bad message",
    "Value too large for defined data type",
    "Name not unique on network",
    "File descriptor in bad state",
    "Remote address changed",
    "Can not access a needed shared library",
    "Accessing a corrupted shared library",
    ".lib section in a.out corrupted",
    "Attempting to link in too many shared libraries",
    "Cannot exec a shared library directly",
    "Invalid or incomplete multibyte or wide character",
    "Interrupted system call should be restarted",
    "Streams pipe error",
    "Too many users",
    "Socket operation on non-socket",
    "Destination address required",
    "Message too long",
    "Protocol wrong type for socket",
    "Protocol not available",
    "Protocol not supported",
    "Socket type not supported",
    "Operation not supported",
    "Protocol family not supported",
    "Address family not supported by protocol",
    "Address already in use",
    "Cannot assign requested address",
    "Network is down",
    "Network is unreachable",
    "Network dropped connection on reset",
    "Software caused connection abort",
    "Connection reset by peer",
    "No buffer space available",
    "Transport endpoint is already connected",
    "Transport endpoint is not connected",
    "Cannot send after transport endpoint shutdown",
    "Too many references: cannot splice",
    "Connection timed out",
    "Connection refused",
    "Host is down",
    "No route to host",
    "Operation already in progress",
    "Operation now in progress",
    "Stale file handle",
    "Structure needs cleaning",
    "Not a XENIX named type file",
    "No XENIX semaphores available",
    "Is a named type file",
    "Remote I/O error",
    "Disk quota exceeded",
    "No medium found",
    "Wrong medium type",
    "Operation canceled",
    "Required key not available",
    "Key has expired",
    "Key has been revoked",
    "Key was rejected by service",
    "Owner died",
    "State not recoverable",
    "Operation not possible due to RF-kill",
    "Memory page has hardware error"
  };
#endif  // __linux__

  static char message[128];
  if ((errnum < 0) || (errnum > ERROR_N)) {
    #ifdef __linux__
    s21_sprintf(message, "Unknown error %d", errnum);
    #elif __APPLE__
    s21_sprintf(message, "Unknown error: %d", errnum);
    #endif
  } else {
    s21_sprintf(message, "%s", errlist[errnum]);
  }
  return message;
}

s21_size_t s21_strlen(const char *str) {
  s21_size_t size = 0;
  while (str[size]) {
    size++;
  }
  return size;
}

// This function used only in strncpy
s21_size_t s21_strnlen(const char *src, s21_size_t n) {
    s21_size_t i = 0;
        for (i = 0; i < n; i++) {
           if (src[i] == '\0')
              break;
        }
    return i;
}

char *s21_strpbrk(const char *str1, const char *str2) {
  char *result = s21_NULL;
  for (; *str1 != '\0'; ++str1) {
    if (s21_strchr(str2, *str1) != s21_NULL) {
      result = (char *) str1;
      break;
    }
  }
  return result;
}

char *s21_strrchr(const char *str, int c) {
  const char *result = s21_NULL;
  if (str != s21_NULL) {
    do {
      if (*str == (char)c) {
        result = str;
      }
    } while (*str++);
  }
  return(char*)result;
}

s21_size_t s21_strspn(const char *str1, const char *str2) {
  const char *symstr1;
  const char *symstr2;
  int count = 0;

  for (symstr1=str1; *symstr1 != '\0'; symstr1++) {
    for (symstr2=str2; *symstr2 != '\0'; symstr2++) {
      if (*symstr1 == *symstr2) {
        count++;
        break;
      }
    }
    if (*symstr1 != *symstr2) {
      break;
    }
  }
  return(count);
}

char *s21_strstr(const char *str1, const char *str2) {
  const char *symstr2;
  const char *p;
  const char *flag = s21_NULL;
  if (*str2 !='\0') {
    for (; *str1 != '\0'; str1++) {
      if (*str1 == *str2) {
        for (p = str1, symstr2 = str2; *symstr2 != '\0'; symstr2++, p++) {
          if (*p != *symstr2) {
            break;
            }
          }
        if (*symstr2 == '\0') {
          flag = str1;
          break;
        }
      }
    }
  } else {flag = str1;}
  return (char*)flag;
}


char *s21_strtok(char *str, const char *delim) {
    static char *copy_base;
    char *str1;
    static char *last;
    char *ch;
    char *tonull;
    int is_null = 0;

    if (str) {
      copy_base = str;
      str1 = copy_base;
    }
    if (!str && *last == '\0') {
      is_null = 1;
      }
    if (!str) {
      str1 = last;
      }

    while (*str1 != 0) {
        ch = str1;
        if (!s21_strchr(delim, *ch)) {
          copy_base = str1;
          break;}
        str1++;
    }

    while (*str1 != 0) {
        tonull = str1;
        if (s21_strchr(delim, *tonull)) {break;}
        str1++;
    }
        if (*str1 == '\0') {
            tonull = str1;
        }

    while (*str1 != 0) {
        ch = str1;
        if (!s21_strchr(delim, *ch)) {
            last = str1;
            break;
        }
        str1++;
    }
    if (*str1 == '\0') {
        last = str1;
    }
    *tonull = '\0';

    char *result = s21_NULL;
    if (is_null == 0) {
      result = copy_base;
    }
    return result;
}

//                                                                          FOURTH PART (SSCANF)
//
//
//
//
//
//
//
//
//
//

int s21_sscanf(char *buf, char*format, ...) {
    va_list args;
    int main_count_for_return = 0;
    int count_for_s_type = 0;
    char* arg_point_for_s_type;
    char* arg_point_for_double_type_end;
    char* arg_point_for_double_type_start;
    char *pointer_for_number_start;
    int flag_number = 0;
    int flag_flag_number = 0;
    int number_count = 0;
    int count_char = 0;
    char temp_arr[200] = "";
    char *pointer_flag_number_start;
    int count_for_n_type = 0;
    char* arg_point_for_n_type_start;
    char* start_pointer = buf;
    int count_for_n_type_format = 0;
    char* arg_point_for_n_type_start_format = format;
    char* start_pointer_format;
    char *check_error_pointer;
    char *check_sym = "-+";
    char *check_sym_float = "-+.,";
    char *check2_sym_float = ".,";
    char *check_sym_hex = "AaBbCcDdEeFf";
    int flag_error = 0;
    int flag_for_dot = 0;
    int null_buf = 0;
    if (*buf == '\0') {main_count_for_return = -1; null_buf=1;}
    va_start(args, format);
    for (; *format; format++) {
        if (null_buf == 1) {break;}
        if (flag_error == 1) {break;}
        if (*format == '*') {break;}
        if (*format == '%') {
            format++;
                    if (*format > '0' && *format <= '9') {
                    flag_flag_number = 0;
                    pointer_for_number_start = format;
                    flag_number = strtol(pointer_for_number_start, &pointer_for_number_start, 10);
                    while (*format >= '0' && *format <= '9') {
                      format++;
                    }
                    flag_flag_number = 1;
                }
                    if (*format == 'h') {format++;}
                    if (*format == 'l') {format++;}
                    if (*format == 'L') {format++;}
            switch (*format) {
// d - Signed decimal integer
                case 'd':
                while (*buf == ' ') {
                buf++;
                }
                check_error_pointer = buf;
                if (s21_strspn(check_error_pointer, check_sym) > 1) {flag_error = 1;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' '
                && *check_error_pointer != '-' && *check_error_pointer != '+') {flag_error = 1;}
                if (s21_strlen(check_error_pointer) > 1) {check_error_pointer++;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' '
                && *check_error_pointer != '-' && *check_error_pointer != '+') {flag_error = 1;}
                for (; *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+'
                && *check_error_pointer != '\0'; check_error_pointer++) {
                if ( (int)*check_error_pointer<48 || (int)*check_error_pointer>57) {flag_error = 1;}}
                if (flag_error == 1) {break;}
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                 *va_arg(args, int*) = strtol(buf, &buf, 10);
                } else {
                s21_memcpy(temp_arr, pointer_flag_number_start, flag_number);
                *va_arg(args, int*) = atoi(temp_arr);
                }
                } else {
                *va_arg(args, int*) = strtol(buf, &buf, 10);}
                flag_number = 0;
                flag_flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// s - String of characters
                case 's':
                while (*buf == ' ') {
                buf++;
                }
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                    if (*buf == '\0') {break;}
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                arg_point_for_s_type = va_arg(args, char*);
                while (*buf == ' ') {
                  buf++;
                }
                    while (*pointer_flag_number_start != ' ') {
                    if (*pointer_flag_number_start == '\0') {break;}
                    arg_point_for_s_type[count_for_s_type] = *pointer_flag_number_start;
                    arg_point_for_s_type[count_for_s_type+1] = '\0';
                    count_for_s_type++;
                    pointer_flag_number_start++;
                    }
                } else {
                    arg_point_for_s_type = va_arg(args, char*);
                    while (*buf == ' ') {
                      buf++;
                    }
                    for (int i = 0; i < flag_number; i++) {
                    if (*buf == '\n') {flag_error = 1; break;}
                    if (*buf == '\t') {flag_error = 1; break;}
                        arg_point_for_s_type[i] = *pointer_flag_number_start;
                        arg_point_for_s_type[i+1] = '\0';
                        pointer_flag_number_start++;
                        }
                }
                flag_flag_number = 0;
                } else {
                arg_point_for_s_type = va_arg(args, char*);
                while (*buf == ' ') {
                  buf++;
                }
                    while (*buf != ' ') {
                    if (*buf == '\0') {break;}
                    if (*buf == '\n') {flag_error = 1; break;}
                    if (*buf == '\t') {flag_error = 1; break;}
                    arg_point_for_s_type[count_for_s_type] = *buf;
                    arg_point_for_s_type[count_for_s_type+1] = '\0';
                    count_for_s_type++;
                    buf++;
                    }
                }
                flag_flag_number = 0;
                number_count = 0;
                flag_number = 0;
                main_count_for_return++;
                break;
// c - Character
                case 'c':
                while (*buf ==' ') {
                  buf++;
                }
                  *va_arg(args, char*) = *buf;
                    while (*buf != ' ') {
                    if (*buf == '\0' || *buf == '-' || *buf == '+' || *buf == '.') {break;}
                    buf++;
                    count_char++;
                    }
                if (count_char > 1) {flag_error = 1; break;}
                flag_flag_number = 0;
                flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// i
                case 'i':
                while (*buf == ' ') {
                buf++;
                }
                check_error_pointer = buf;
                if (s21_strspn(check_error_pointer, check_sym) > 1) {flag_error = 1;}
                if (((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && !s21_strspn(check_error_pointer, check_sym_hex)) {flag_error = 1;}
                if (s21_strlen(check_error_pointer) > 1) {check_error_pointer++;}
                if (((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' '
                && *check_error_pointer != '-' && *check_error_pointer != '+'
                && !s21_strspn(check_error_pointer, check_sym_hex))
                {flag_error = 1;}
                for (; *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+'
                && *check_error_pointer != '\0'; check_error_pointer++) {
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && !s21_strspn(check_error_pointer, check_sym_hex)) {flag_error = 1;}}
                if (flag_error == 1) {break;}
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                 *va_arg(args, unsigned int*) = strtol(buf, &buf, 10);
                } else {
                s21_memcpy(temp_arr, pointer_flag_number_start, flag_number);
                *va_arg(args, unsigned int*) = atoi(temp_arr);
                }
                } else {
                *va_arg(args, unsigned int*) = strtol(buf, &buf, 10);}
                flag_number = 0;
                flag_flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// e - Decimal floating point or scientific notation (mantissa/exponent)
                case 'e':
// E - Decimal floating point or scientific notation (mantissa/exponent)
                case 'E':
// f - Decimal floating point or scientific notation (mantissa/exponent)
                case 'f':
// g - Decimal floating point or scientific notation (mantissa/exponent)
                case 'g':
// G - Decimal floating point or scientific notation (mantissa/exponent)
                case 'G':
                while (*buf == ' ') {
                buf++;
                }
                flag_for_dot = 0;
                check_error_pointer = buf;
                if (s21_strspn(check_error_pointer, check_sym_float) > 2) {flag_error = 1;}
                if (s21_strspn(check_error_pointer, check_sym) > 1) {flag_error = 1; break;}
                if (s21_strspn(check_error_pointer, check2_sym_float) > 1) {flag_error = 1; break;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' '
                && *check_error_pointer != '-' && *check_error_pointer != '+' && *check_error_pointer != '.'
                ) {flag_error = 1; break;}
                if (s21_strlen(check_error_pointer) > 1) {check_error_pointer++;}
                if (  ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' '
                && *check_error_pointer != '-' && *check_error_pointer != '+' && *check_error_pointer != '.'
                ) {flag_error = 1; break;}
                for (; *check_error_pointer != ' ' && *check_error_pointer
                != '-' && *check_error_pointer != '+'
                && *check_error_pointer != '\0'; check_error_pointer++) {
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != '.'
                ) {flag_error = 1; break;}
                if (*check_error_pointer == '.') {flag_for_dot++;}
                if (flag_for_dot > 1) {flag_for_dot=0; flag_error=1; break;}
                }
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                while (*buf == ' ') {
                buf++;
                }
                } else {
                s21_memcpy(temp_arr, pointer_flag_number_start, flag_number);
                *(float*)va_arg(args, char*) = atof(temp_arr);
                }
                } else {
                arg_point_for_double_type_end = buf;
                arg_point_for_double_type_start = buf;
                while (*arg_point_for_double_type_end != ' ') {
                  if (*arg_point_for_double_type_end == '\0') {break;}
                  arg_point_for_double_type_end++;
                }
                  buf = arg_point_for_double_type_end;
                  *(float*)va_arg(args, char*) = atof(arg_point_for_double_type_start);
                }
                flag_flag_number = 0;
                number_count = 0;
                flag_number = 0;
                main_count_for_return++;
                break;
// o - Unsigned octal
                case 'o':
                while (*buf == ' ') {
                buf++;
                }
                check_error_pointer = buf;
                if (s21_strspn(check_error_pointer, check_sym) > 1) {flag_error = 1; break;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 55)
                && *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+') {flag_error = 1; break;}
                if (s21_strlen(check_error_pointer) > 1) {check_error_pointer++;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 55)
                && *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+') {flag_error = 1; break;}
                for (; *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+' && *check_error_pointer != '\0'; check_error_pointer++) {
                if ( (int)*check_error_pointer<48 || (int)*check_error_pointer>55) {flag_error = 1; break;}}
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                 *va_arg(args, int*) = strtol(buf, &buf, 8);
                } else {
                s21_memcpy(temp_arr, pointer_flag_number_start, flag_number);
                *va_arg(args, int*) = atoi(temp_arr);
                }
                } else {
                *va_arg(args, int*) = strtol(buf, &buf, 8);}
                flag_number = 0;
                flag_flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// u - Unsigned decimal integer
                case 'u':
                while (*buf == ' ') {
                buf++;
                }
                check_error_pointer = buf;
                if (s21_strspn(check_error_pointer, check_sym) > 1) {flag_error = 1;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+') {flag_error = 1;}
                if (s21_strlen(check_error_pointer) > 1) {check_error_pointer++;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+') {flag_error = 1;}
                for (; *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+' && *check_error_pointer != '\0'; check_error_pointer++) {
                if ( (int)*check_error_pointer<48 || (int)*check_error_pointer>57) {flag_error = 1;}}
                if (flag_error == 1) {break;}
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                 *va_arg(args, unsigned int*) = strtol(buf, &buf, 10);
                } else {
                s21_memcpy(temp_arr, pointer_flag_number_start, flag_number);
                *va_arg(args, unsigned int*) = atoi(temp_arr);
                }
                } else {
                *va_arg(args, unsigned int*) = strtol(buf, &buf, 10);}
                flag_number = 0;
                flag_flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// x - Unsigned hexadecimal integer (any letters)
                case 'x':
// X - Unsigned hexadecimal integer (any letters)
                case 'X':
                while (*buf == ' ') {
                buf++;
                }
                check_error_pointer = buf;
                if (s21_strspn(check_error_pointer, check_sym) > 1) {flag_error = 1; break;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && !s21_strspn(check_error_pointer, check_sym_hex)) {flag_error = 1; break;}
                if (s21_strlen(check_error_pointer) > 1) {check_error_pointer++;}
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+'
                && !s21_strspn(check_error_pointer, check_sym_hex) ) {flag_error = 1; break;}
                for (; *check_error_pointer != ' ' && *check_error_pointer != '-'
                && *check_error_pointer != '+'
                && *check_error_pointer != '\0'; check_error_pointer++) {
                if ( ((int)*check_error_pointer < 48 || (int)*check_error_pointer > 57)
                && !s21_strspn(check_error_pointer, check_sym_hex))
                {flag_error = 1; break;}}
                if (flag_flag_number == 1) {
                pointer_flag_number_start = buf;
                while (*buf != ' ') {
                  number_count++;
                  buf++;
                }
                if (number_count <= flag_number) {
                 *va_arg(args, unsigned int*) = strtol(buf, &buf, 16);
                } else {
                s21_memcpy(temp_arr, pointer_flag_number_start, flag_number);
                *va_arg(args, unsigned int*) = atoi(temp_arr);
                }
                } else {
                *va_arg(args, unsigned int*) = strtol(buf, &buf, 16);}
                flag_number = 0;
                flag_flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// p - Pointer address
                 case 'p':
                 while (*buf == ' ') {
                 buf++;
                 }
                 *va_arg(args, unsigned long*) = strtol(buf, &buf, 16);
                 while (*buf != ' ') {
                   number_count++;
                   buf++;
                 }
                flag_number = 0;
                flag_flag_number = 0;
                number_count = 0;
                main_count_for_return++;
                break;
// n - Number of characters scanned until %n occurs
                case 'n':
                count_for_n_type = 0;
                arg_point_for_n_type_start = start_pointer;
                    count_for_n_type_format = 0;
                    start_pointer_format = arg_point_for_n_type_start_format;
                  while (*buf == ' ') {
                  buf++;
                }
              for (; arg_point_for_n_type_start < buf; arg_point_for_n_type_start++) {
              count_for_n_type++;
              }
            for (; *start_pointer_format != 'n'; start_pointer_format++) {
            count_for_n_type_format++;}
                    if (count_for_n_type_format > 0) {
                        for (int i = count_for_n_type_format; i > 0; i--) {
                            if (arg_point_for_n_type_start_format[i] == '%') {
                                i--;
                                if (arg_point_for_n_type_start_format[i] != ' ') {
                                    count_for_n_type--;
                                    break;}
                            }
                        }
                    }
                        *va_arg(args, int*) = count_for_n_type;
                    flag_number = 0;
                    flag_flag_number = 0;
                    number_count = 0;
                break;}}}
va_end(args);
return(main_count_for_return);}




//                                        FIFTH PART



void *s21_to_upper(const char *str) {
  char *ret = (char*)calloc(s21_strlen(str)+1, sizeof(char));
        if (!ret) {
          exit(1);
        }
       for (s21_size_t i = 0; i < s21_strlen(str); i++) {
            if (str[i] > 96 && str[i] < 123) {
            ret[i] = str[i] - 32;
            } else {
              ret[i] = str[i];
              continue;
              }
       }
  return ret;
}

void *s21_to_lower(const char *str) {
  char *ret = (char*)calloc(s21_strlen(str)+1, sizeof(char));
        if (!ret) {
           exit(1);
        }
       for (s21_size_t i = 0; i < s21_strlen(str); i++) {
            if (str[i] > 64 && str[i] < 91) {
            ret[i] = str[i] + 32;
            } else {
              ret[i] = str[i];
              continue;
              }
       }
  return ret;
}

void *s21_insert(const char *src, const char *str, s21_size_t start_index) {
    char* dst = s21_NULL;
    if (src && str && s21_strlen(src) >= start_index) {
        dst = calloc(s21_strlen(src) + s21_strlen(str) + 2, sizeof(char));
        if (!dst) exit(1);
        s21_memmove(dst, src, start_index);
        dst += start_index;
        s21_memmove(dst, str, s21_strlen(str));
        dst += s21_strlen(str);
        s21_memmove(dst, src+start_index, s21_strlen(src)-start_index);
        dst -= s21_strlen(str) + start_index;
    }
    return (void*)dst;
}

void *s21_trim(const char *src, const char *trim_chars) {
    char* result = s21_NULL;
    if (src) {
        result = calloc(s21_strlen(src)+1, sizeof(char));
        if (!result) exit(1);
        char* start = s21_NULL;
        char* end = s21_NULL;
        int i = 0;
        char* s = (char*)src;
        if (trim_chars && trim_chars != "") {
            s += s21_strspn(src, trim_chars);
            start = s;
            s += s21_strlen(s) - 1;
            for ( ; ; s--) {
               if (!s21_strspn(s, trim_chars)) {
                   end = s;
                   break;
                }
            }
            for (; start <= end; start++, i++) {
                result[i] = *start;
            }
            result[i] = '\0';
        }
        if (!trim_chars || trim_chars == "") {
            s += s21_strspn(src, " \t\n");
            start = s;
            s += s21_strlen(s) - 1;
            for (; ; s--) {
               if (!s21_strspn(s, " \t\n")) {
                   end = s;
                   break;
                }
            }
            for (; start <= end; start++, i++) {
                result[i] = *start;
            }
            result[i] = '\0';
        }
    }
    result = realloc(result, (s21_strlen(result)+1)*sizeof(char));
    return (void*)result;
}
