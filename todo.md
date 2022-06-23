

# global structure,

I would like to make a structure in this repo. The steps i would like to do are:

## Start a new repo for a downloader to this repo that can:
1. Download from raw.git.

1. Disable cheats within an interactive cheat sheet

1. Enable cheats within an interactive cheat sheet


### Something like this?


i. Download from raw.git.

```bash
export repo="https://raw.githubusercontent.com/esp0xdeadbeef/cheat.sheets/main/bruteforce.cheat"
export repo="<raw_github_url>"
export output_dir="$HOME/.local/share/navi/cheats/$(echo $repo | awk -F '/' '{print $4"__"$5}')"
mkdir $output 2> /dev/null
wget $repo -P $output
```

ii. Disable cheats within an interactive cheat sheet

```bash
find ~/.local/share/navi/cheats/ -name '*.cheat' | grep <cheats_to_disable> | while read line; do mv $line $line.old; done
# or something like this:
find ~/.local/share/navi/cheats/ -name '*<cheats_to_disable>*.cheat' -exec echo mv {} {}.old \;
```

iii. Re enable (old) cheats within an interactive cheat sheet 

```bash
find ~/.local/share/navi/cheats/ -name '*.cheat.old' | grep dns | while read line; do mv $line $(echo "$line" | sed 's/\.old//g' ); done
# or something like this (needs rename util `apt install rename -y`):
find ~/.local/share/navi/cheats/ -name '*.cheat.old' -exec rename 's/\.old//;' {} \;
```



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





