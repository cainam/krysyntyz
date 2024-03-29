## building packages
one node acts as builder, the others are consumers only which require the following entries in make.conf:
PORTAGE_BINHOST="ssh://<package builder user>@<package builder host>/var/cache/binpkgs"
EMERGE_DEFAULT_OPTS="--usepkgonly --getbinpkgonly"

## patching
Sometimes build lead to errors, that can be fixed without having to wait for a fix on gentoo site. When fixed via gentoo, the patches can be removed again.
It is very easy to create such a patch, simply create a /before and /after folder, make your corrections in after and create the patch:
    
    diff -Naur vorher/ nachher/ > patch.txt

## Locales

generating locales that are never used is waste. Let's reduce the waste, see https://wiki.gentoo.org/wiki/Localization/Guide  for further reading:
```
# grep -v -e ^$ -e ^# /etc/locale.gen
# locale-gen
# eselect locale list
Available targets for the LANG variable:
  [1]   C
  [2]   C.utf8
  [3]   de_DE.utf8
  [4]   en_US
  [5]   en_US.iso88591
  [6]   en_US.utf8
  [7]   POSIX
  [8]   C.UTF8 *
  [ ]   (free form)
```
