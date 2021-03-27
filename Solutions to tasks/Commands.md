### 02 Commands

---
**02-a-5506.txt**:

`find ~ -newer /tmp/os2018/f1 -exec rm -i {} +`

---
**02-a-6000.txt**:

`find /bin -perm -007 -exec ls -l {} +`


---
**02-a-8000.txt**:

`find /bin -perm 007 -exec cp {} ~/bin2 \`
Не можах да накарам cp да си направи сама директорията bin2


---
**02-a-9000.txt**:

`find ~/bin2 -name b* -exec tar -c -f ~/b_start.tar {} \`


---
**02-a-9500.txt**:

`find /etc -type f -exec wc -l {} \`
