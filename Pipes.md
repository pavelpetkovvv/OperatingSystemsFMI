### Pipes

---
**03-a-0200.txt**:

`cat /etc/passwd | sort -d`


---
**03-a-0201.txt**:

Сортирах passwd числово чрез следната команда:

`cat /etc/passwd | sort -n`

За да сравня изхода от лексикографското и числовото сортиране, направих следното:

Записах изходите от двете сортировки:
 
`cat /etc/passwd | sort -n > ~/numerical_sort`

`cat /etc/passwd | sort -d > ~/alphabetical_sort`

Използвах командите diff, а след това и comm, за да изведа различните редове от двата файла:
 
`diff ~/numerical_sort ~/alphabetical_sort`

comm  --total ~/numerical_sort ~/alphabetical_sort
Чрез двете команди установх, че няма разлика между двата изхода


---
**03-a-0210.txt**:

`cut -d : -f 1,5 /etc/passwd`


---
**03-a-0211.txt**:

`cut -b 2-6 /etc/passwd`


---
**03-a-0212.txt**:

`cut -d : -f 1,6 /etc/passwd`


---
**03-a-0213.txt**:

`cut -d / -f 2 /etc/passwd`

---
**03-a-1500.txt**:

Става и по двата начина

`wc -c -m -l /etc/passwd`
`wc --bytes --chars --lines /etc/passwd`

Изходът е 3 числа и името на файла.

Как да го направя да изписва bytes: [брой на байтове] (без да записвам изхода във файл)???

`echo "bytes: "| wc --bytes /etc/passwd`


---
**03-a-2000.txt**:

`head -12 /etc/passwd`

`head -c 26 /etc/passwd`

`head -n -5 /etc/passwd`

`tail -n 17 /etc/passwd`

`cat -n /etc/passwd | head -n 151 | tail -1`

`cat -n /etc/passwd | head -n 13 | tail -1 | tail -c 5`

---
**03-a-3000.txt**:

`df -P | tail -n +2 | tr -s " " | sort -n -t " " -k 2 -r`

---
**03-a-5000.txt**:

`cat /etc/passwd | grep "s62302:"`

 `cat /etc/passwd | grep "s62302:" -B 2`
 
 `cat /etc/passwd | grep "s62302:" -B 2 -A 3`

---
**03-a-5001.txt**:

`cut -d : -f 7 /etc/passwd | grep --color -v /bin/bash | wc -l`

---
**03-b-0300.txt**:

`grep s62302 /etc/passwd | cut -d : -f 4`

---
**03-b-3400.txt**:

`grep --color '#' /etc/services | wc -l`

---
**03-b-3500.txt**:

`file /bin/* | grep shell script | cut -d ' ' -f 1`

---
**03-b-3600.txt**:
Не съм сигурен дали това решение е вярно

`find / -maxdepth 3 -type d -perm o=`

---
**03-b-4000.txt**:

`mkdir ~/dir5`

`touch ~/dir5/file{1,2,3}`

`wc --lines --words --chars ~/dir5/file{1,2,3}`

*статистика за броя редове, думи и символи за всеки един файл

`wc --lines --chars ~/dir5/file{1,2,3} | tail -n 1`

* статистика за броя редове и символи за всички файлове

`wc --lines ~/dir5/file{1,2,3} | tail -n 1`

* общия брой редове на трите файла

---
**03-b-5200.txt**:

`cat /etc/passwd | grep --color a | tr -d 'a' | wc --chars`

---
**03-b-5300.txt**:
Намира уникалните символи, като главна и малка буква ги брои за два символа

`cut -d : -f 5 /etc/passwd | cut -d , -f 1 | sed 's/(.)/1n/g' | sort | uniq | wc -l`

---
**03-b-5400.txt**:

`grep -v ov /etc/passwd`

---
**03-b-6100.txt**:

`cut -d : -f 3 /etc/passwd | head -n 46 | tail -n +28 | grep  -o '[0-9]$'`

---
**03-b-6700.txt**

`find /tmp/* -maxdepth 0 -type f -readable -exec stat -c '%A %n' {} \;`

---
**03-b-7500.txt**

`cat /etc/services | sed  "s/\t/ /g" | tr -s " " | sed "s/ /\n/g" | sort | uniq -c | sort -r -n -k 1 | grep [[:alpha:]] | head -n 10`

---
**03-b-8000.txt**

`cat /etc/passwd | cut -d : -f 1 | grep --color ^s[0-9] | sed s/s//g | sort -n`

---
**03-b-8520.txt**

`cat /etc/passwd | cut -d : -f 1 | grep -v [0-9] | tr [[:lower:]] [[:upper:]]`

---
**03-b-8700.txt**

`cut -d : -f 4 /etc/passwd | sort -n | uniq -c | sort -rn -k 1 | head -5`

---
**03-b-7000.txt**

`find / -readable -type f -name *\.c -print 2>/dev/null | wc -l`

Намира брой файлове, завършващи на .c (В цялата файлова система)
cat $(find / -readable -type f -name *\.c -print 2>/dev/null) | wc -l
Намира броя на редовете на всички .c файлове

---
**03-b-8500.txt**

`cut -d : -f 1 /etc/group | sed 's/\(.*\)/Hello \1/g' | sed 's/\(students*\)/\1 - it is me/g'`

Тук приемаме, че знам, че съм от група students, долния вариант ни го дава автоматично

`cut -d : -f 1 /etc/group | sed 's/\(.*\)/Hello \1/g' | sed "s/($(id -ng $(whoami))*)/1 - it is me/g"`

Този вариант работи само, ако кавичките на sed са двойни (") 

---
**03-b-8600.txt**

`cat $(find / -readable -name "*.sh" 2>>/dev/null) | grep "#!" | sed 's/!\s\//!\//' | sort | uniq -c |sort -rn -k 1`