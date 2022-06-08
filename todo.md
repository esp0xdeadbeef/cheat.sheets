
# forensics
## add sleuthkit
https://www.autopsy.com/download/
https://github.com/sleuthkit/sleuthkit/

## add sysinternals
https://github.com/davehardy20/sysinternals

accesschk.exe -ucqv [service_name] (requires sysinternals accesschk!)


## add msfvenom cheats (key;val, searchable for exploit, maybe add a cron so this list is always accurate from my box)
msfvenom --list payloads | tee /tmp/msfpayloads
### without description
tail -n +7 /tmp/msfpayloads | awk '{print $1}' | fzf
### with description
tail -n +7 /tmp/msfpayloads | fzf | awk '{print $1}'
