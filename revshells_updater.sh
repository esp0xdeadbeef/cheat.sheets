#!/bin/bash

curl -Ss https://raw.githubusercontent.com/mthbernardes/rsg/master/shells.txt -o /tmp/shells.txt 
cat > /tmp/scrape.py << EOF
a = open("/tmp/shells.txt")
b = a.read()
a.close()
b= b.replace('[IPADDR]', '<ip_target>').replace('[PORT]', '<port>').strip()
c=[element for element in b.split('\n')]
d = [ i.split('|')[0].strip() for i in c ]
e = [ '|'.join(i.split('|')[1:]).strip() for i in c ]
[ print(f"# {i.capitalize()}\n" + e[c] + "\n") for c, i in enumerate(d) ] 
EOF
echo -e '% rev shells generated from github/mthbernardes/rsg\n' | tee revshells_generated.cheat

# printf "%q" "$(head -n 3 ./rev-shells.cheat | grep -i ' IP:' | sed 's/\$ IP: //g' )"
echo for\ adaptername\ in\ \$\(for\ i\ in\ \"\$\(ip\ a\ s\ \|\ sort\ -r\ \|\ grep\ -E\ \$\'\[\[:digit:\]\]:\[\ \]\'\)\"\;\ do\ echo\ \$\(echo\ \$i\ \|\ awk\ \'\{print\ \$2\}\'\ \|\ replace\ :\ \'\'\)\;\ done\)\;\ do\ ip\ a\ s\ \$adaptername\ \|\ grep\ \'inet\\\ \'\ \|\ awk\ \'\{print\ \$2\}\'\ \|\ cut\ -d\ \'/\'\ -f\ 1\ \;\ done\ \|\ uniq | tee -a revshells_generated.cheat

python3 /tmp/scrape.py | tee -a revshells_generated.cheat
rm /tmp/scrape.py /tmp/shells.txt
