# rfc-cli-downloader

A CLI tool for downloading RFCs as txt files.

I am an avid command line user and I didn't like having to view RFCs from a
browser. I wanted to view them in Neovim, so I wrote a tiny little script to
download RFCs in parallel using `wget` and `parallel`.

## Usage

To download the RFC1945 simply type:
```sh
$ rfc 1945
$ ls
rfc1945.txt
```
This script uses `GNU parallels` to download each RFC in parallel:
```sh
$ rfc 1945 7230 7540
$ ls
rfc1945.txt rfc7230.txt rfc7540.txt
```

## Install

Download the script `rfc.sh`, make it executable, and have it on your path.

I prefer to symlink it to a folder I have specifically for scripts:
```sh
ln -s <install-path>/rfc.sh ~/.scripts/rfc
```
