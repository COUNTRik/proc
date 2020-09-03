#!/bin/bash

# Добавляем заголовки к столбцам
echo "PID TTY ST TIME NAME" | awk '{printf "%-6s %-6s %-2s %-5s %s\n", $1, $2, $3, $4, $5}'

# Проходим циклом все папки с процессами
for path in /proc/[0-9]*
do

# Cохраняем данные с файла stat в переменную $stat и с файла cmdline в переменную $cmd
stat=$(cat $path/stat | tr -d "(" | tr -d ")")
cmd=$(cat $path/cmdline)

# Выводим необходимые нам данные с помощью awk
# echo $stat | awk '{printf "%-6s %-6s %-2s %-10s\n", $1, $4 ,$3, $2}'
echo $stat $cmd | awk '{printf "%-6s %-6s %-2s %-5s %s\n", $1, $4 ,$3, ($14 + $17)/100, $53}'
done