# Lipu e pilin
Lipu e pilin (Toki Pona for "document experiences"), is just a bunch of scripts to allow you to do microblogging using git commits.

You can use it as an offline/downloadable blog, readable with git log, or as a traditional web page, with the index.html generate at each commit.

## How it works
When you create a commit, the pre-commit hook runs a perl script to export a git log in a neat and simple HTML file.

## Requirements
- Linux/UNIX system
- Perl

## Installation
Download the latest release. After extracting it, run `git init` in the directory.  
Copy the pre-commit hook in your .git/hooks directory.  
Et voilà!

Note: because the HTML file is created by parsing a git log command, it’s always late of 1 commit.

## Demo
If you want to see the HTML page render, here you can see [my personal lipu e pilin log](https://june.lacoloc.cafe/log.html)
