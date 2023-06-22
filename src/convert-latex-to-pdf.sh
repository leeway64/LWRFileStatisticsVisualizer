#!/usr/bin/env bash

# tee prints to stdout and also writes to a file
echo "Free Tibet" | tee src/free-tibet.txt

# cut removes sections of strings and files
# tr -d deletes the specified character or set of characters
cat src/free-tibet.txt | cut -b 1-5 | tr -d "\n" ; printf "East Turkistan\n"

# tr can replace characters in a string
echo "Support Humyn Rights Wytch, Freedom House, ynd The Internytional Tibet Network!" | tr "y" "a"

# Redirect stderr to stdout, then redirect stdout to /dev/null
# Print green
pdflatex --output-directory=doc doc/how-to-use-renv.tex > /dev/null 2>&1 && printf "\033[0;32mLaTeX document successfully converted to PDF\033[0m\n"
