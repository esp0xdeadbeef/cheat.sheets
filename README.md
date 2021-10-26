# cheat.sheets

A directory of cheat sheets to use with TLDR, cheat.sh, or Navi.

## Installing

1. Install `fd-find fzf` if you don't have them:

    `$ sudo apt install fd-find fzf`

### notes for arch 

```bash
cargo install fd-find # via rust and add ~/.cargo/bin/ to $PATH
# add  fdfind to /sbin/fdfind
ln -sf ~/.cargo/bin/fd /sbin/fdfind
# or
pacman -Sy fd
# add fd to /sbin/fdfind
ln -sf $(which fd) /sbin/fdfind
```

1. Install `cargo` if you don't have it (example the bash before piping it to `sh`):

    `$ curl https://sh.rustup.rs -sSf | sh`

1. **Install [Navi](https://github.com/denisidoro/navi) (and FeroxBuster and Rustscan if you don't have them) with**:

    `$ cargo install navi feroxbuster rustscan`

1. Add the pentest cheat sheets by adding the repo to navi:

    `$ navi repo add esp0xdeadbeef/cheat.sheets`

    and check out the [infosecstreams cheat.sheets!](https://github.com/infosecstreams/cheat.sheets) :)

    `$ navi repo add infosecstreams/cheat.sheets`


### Installing the shell widget

If you want to the shell widget (hint: you do), add this line to your `.bashrc`_**-like**_ file:

```shell
# bash
eval "$(navi widget bash)"

# zsh
eval "$(navi widget zsh)"

# fish
navi widget fish | source
```

You should restart your shell session. Now when you press `ctrl+g` and you should get a list of all the shortcuts!

## Running

1. Run `navi` :

    `$ navi` or ... press `ctrl+g` if you installed the widget...!!!# cheat.sheets
