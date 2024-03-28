#!/bin/bash
# 
# @author Anakin Childerhose
#
# This script is to download rfcs easily from the command line so that they
# don't need to be viewed in the browser. I prefer downloading the .txt files
# so I can browse them in Vim.

# List of dependencies
dependencies=(wget parallel)

missing_dependencies=()

# Check for dependencies
for dep in "${dependencies[@]}"; do
    command -v "$dep" &> /dev/null || missing_dependencies+=("$dep")
done

print_missing_dep () {
    printf "\e[31m%.0s#\e[0m" {1..80}
    printf "\n\e[31mMissing Dependencies:\n"
    for dep in "${missing_dependencies[@]}"; do
        printf "\t$dep\n"
    done
    printf "\e[0m"
    printf "\e[31m%.0s#\e[0m" {1..80}
    echo
    exit 2
}

# Tell user what dependencies they are missing if any
[ ${#missing_dependencies[@]} -eq 0 ] || print_missing_dep

no_args () {
    printf "\e[31mNo RFCs passed to script\e[0m\n"
    exit
}

# Exit if no args were passed to script
[ ! "$#" -eq 0 ] || no_args

err_invalid_num () {
    printf "\e[31m%.0s#\e[0m" {1..80}
    printf "\n\e[31mInvalid argument:  $1\e[0m\n"
    printf "\e[31m%.0s#\e[0m" {1..80}
    echo
    exit 2
}

err_download_failed () {
    printf "\e[31m%.0s#\e[0m" {1..80}
    printf "\n\e[31mDownload failed for $1\e[0m\n"
    printf "\e[31m%.0s#\e[0m" {1..80}
    echo
    exit 2
}

download () {
    # Check if an arg is a number for soft error checking
    [[ "$1" =~ ^[0-9]{1,5}$ ]] || err_invalid_num "$1"

    # Download RFC or error out
    wget "https://www.rfc-editor.org/rfc/rfc$1.txt" || err_download_failed "$1"
}
# Make the function visible to parallel
export -f download

# Run the download function for each argument passed
parallel download ::: "$@"