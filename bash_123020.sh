#!/bin/bash

[ $# -ne 2 ] && { echo "Usage: $0 first_parameter second_parameter"; exit 1; }

# UID        PID  PPID  C STIME TTY          TIME CMD
# root         1     0  3 09:28 ?        00:00:01 /usr/lib/systemd/systemd --switched-root --system --deserialize 22
# root         2     0  0 09:28 ?        00:00:00 [kthreadd]
# root         3     2  0 09:28 ?        00:00:00 [ksoftirqd/0]

echo `ps -ef | awk -F" " '{print $1}' | sort | uniq -c`

# list last 3 lines of a file without using tail

lists=()

for a in `cat /opt/bash_test2/list`
do
  echo $a
  lists=(${lists[@]} $a)
done

for b in ${lists[@]}
do
  echo $b
done

c=${#lists[@]}

echo $c

for d in {1..3}
do
  echo ${lists[$(( c - 1 ))]}
  c=$(( c - 1 ))
done

# rename file extension from doc to txt

# file expansion

# touch /tmp/junk{1..3}.doc
# 
# for e in `ls /tmp/junk*`
# do
#   cd /tmp && mv $e ${e/%doc/txt}
# done

# positional parameters

IFS=","

echo "script name is $0"
echo "first parameter is $1"
echo "second parameter is $2"
echo "total number of parameter is $#"
echo "showing all the parameters $@"
echo "showing all the parameters with IFS $*"

# if else statement
# command substitution

grep g2 /etc/passwd

if [ $? -eq 0 ]
then
  echo "g2 user exists on this host $(hostname)"
else
  echo "g2 user NOT exist on this host $(hostname)"
fi

# case statement

# echo -n "your favorite scripting language pls: "
# read language
# 
# case $language in
#   Python)
#     echo "Python is your favorite language~~"
#     ;;
#   Java)
#     echo "Java is your choice !!!"
#     ;;
#   *)
#     echo "No scripting for you!!!"
#     ;;
# esac
# 
# # function
# 
# echo -n "First name pls: "
# read first
# 
# echo -n "Last name pls: "
# read last
# 
# hello () {
#   echo "Your name is $first $last"
# }
# 
# hello

# Logical AND & OR & NOT

[ ! -f /tmp/file123020 ] && echo "file123020 NOT exist" || echo "file123020 exists"

[ -f /tmp/file123020 ] && echo "file123020 exists" || echo "file123020 NOT NOT exists"

# arithmetic function

# find out the most disk used files or dirs on each dir

for f in /*
do
  [ -d $f ] && ( echo $f; cd $f; echo `du -sh * 2>/dev/null | sort -rn | head -3` )
done

# find out the files order than 30 days on each dir and display them

# for g in /*
# do
#   [ -d $g ] && ( echo $g; cd $g; echo `find . -type f -mtime +30 -exec ls -lhrt {} \;` )
# done

# compound commands

(date; hostname; w | wc -l) > /tmp/trash123020
echo `cat /tmp/trash123020`
