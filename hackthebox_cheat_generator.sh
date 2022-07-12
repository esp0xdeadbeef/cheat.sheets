#/bin/bash

# copy the webpage cheatsheet (one each time)

xclip -out -selection clipboard > /tmp/example.txt
# contents of the file /tmp/example.txt:
Ffuf
Command	Description
ffuf -h	ffuf help
ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/FUZZ	Directory Fuzzing
ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/indexFUZZ	Extension Fuzzing
ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/blog/FUZZ.php	Page Fuzzing
ffuf -w wordlist.txt:FUZZ -u http://SERVER_IP:PORT/FUZZ -recursion -recursion-depth 1 -e .php -v	Recursive Fuzzing
ffuf -w wordlist.txt:FUZZ -u https://FUZZ.hackthebox.eu/	Sub-domain Fuzzing
ffuf -w wordlist.txt:FUZZ -u http://academy.htb:PORT/ -H 'Host: FUZZ.academy.htb' -fs xxx	VHost Fuzzing
ffuf -w wordlist.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php?FUZZ=key -fs xxx	Parameter Fuzzing - GET
ffuf -w wordlist.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'FUZZ=key' -H 'Content-Type: application/x-www-form-urlencoded' -fs xxx	Parameter Fuzzing - POST
ffuf -w ids.txt:FUZZ -u http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'id=FUZZ' -H 'Content-Type: application/x-www-form-urlencoded' -fs xxx	Value Fuzzing
# end of /tmp/example.txt

(echo "hack the box cheat: "; head -n 1 /tmp/example.txt) | tr '\n' ' ' | sed 's/\t\|\s/ /g' | sed 's/  / /g' > /tmp/headings.txt
echo ''
tail -n +3 /tmp/example.txt | grep . | awk -F '\t' '{print "# '"$(cat /tmp/headings.txt)"'" $2 "\n" $1 "\n"}' | tee /tmp/output.txt
sed -i 's/wordlist.txt:FUZZ/<wordlist>/g' /tmp/output.txt
cat /tmp/output.txt | xclip -sel clip

Wordlists
Command	Description
/opt/useful/SecLists/Discovery/Web-Content/directory-list-2.3-small.txt	Directory/Page Wordlist
/opt/useful/SecLists/Discovery/Web-Content/web-extensions.txt	Extensions Wordlist
/opt/useful/SecLists/Discovery/DNS/subdomains-top1million-5000.txt	Domain Wordlist
/opt/useful/SecLists/Discovery/Web-Content/burp-parameter-names.txt	Parameters Wordlist
Misc
Command	Description
sudo sh -c 'echo "SERVER_IP academy.htb" >> /etc/hosts'	Add DNS entry
for i in $(seq 1 1000); do echo $i >> ids.txt; done	Create Sequence Wordlist
curl http://admin.academy.htb:PORT/admin/admin.php -X POST -d 'id=key' -H 'Content-Type: application/x-www-form-urlencoded'