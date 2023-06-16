# Руссинатор

[English](README_ENG.md) [Русский](README.md)

Translation of the layout `QWERTY` to `YTSUKEN`. Replaces the selected text written by `qwerty` with `ytsuken`

## Requirements

- nim
- X11 (xdotool, xclip)

## Сборка

``` shell
chmod +x *.sh
./build.sh    # build executable
```

## Set Up & Usage

In the distribution settings, set a keyboard shortcut that is convenient for you in order to activate the script

In the command field, specify the path to the executable file

## Install

By default, the installation moves the file along the path: `~/.local/bin/`

``` shell
./install.sh 
```

If the console does not see the executable file, add:

- `export PATH=/home/username/.local/bin:$PATH`

or

- `export PATH=/~/.local/bin:$PATH`

at the end of your `.bashrc` or `.zshrc` file

## Uninstall

Deletes the executable file from `~/.local/bin/`

``` shell
./uninstall.sh 
```
