#!/bin/bash
find . -type f -exec grep . -Iq {} \; -exec nkf -w -Lu --overwrite {} \; -and -print
# The function of this script is to convert the character encoding
# of all japanese text files under current direcotory to UTF-8
# (-w option in nkf).
# When you want to unify a different character encoding,
# change the option -w in nkf as
# -j ISO-2022-JP,
# -s Shift-JIS,
# -e EUC-JP,
# -w UTF-8.
# When you want other newline character, change the option -Lu in nkf as
# -Lw CRLF(for Windows),
# -Lm CR,
# -Lu LF.
# If your os don't have nkf, you need to install nkf.
# (i.e. $ sudo apt-get install nkf)
# The parts of the script is quoted by
# http://stackoverflow.com/questions/4767396/linux-command-how-to-find-only-text-files
# for extract all text files under current directory:
# $ find . -type f -exec grep . -Iq {} \; -and -print
