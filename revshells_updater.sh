#!/usr/bin/env bash

set -euo pipefail

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

shells_txt="$tmpdir/shells.txt"
scraper="$tmpdir/scrape.py"
generated="$tmpdir/revshells_generated.cheat"

curl -fsSL https://raw.githubusercontent.com/mthbernardes/rsg/master/shells.txt -o "$shells_txt"

cat > "$scraper" << 'EOF'
from pathlib import Path

source = Path("shells.txt").read_text()
source = source.replace("[IPADDR]", "<IP>").replace("[PORT]", "<port>").strip()

for line in source.splitlines():
    name, _, command = line.partition("|")
    name = name.strip()
    command = command.strip()
    if not name or not command:
        continue
    print(f"# {name.capitalize()}\n{command}\n")
EOF

{
  printf '%% rev shells generated from github/mthbernardes/rsg\n\n'
  cat ./variables.template
  printf '\n'
  (cd "$tmpdir" && python3 "$scraper")
} > "$generated"

mv "$generated" revshells_generated.cheat
