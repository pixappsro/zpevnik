#!/bin/bash

commit=$1
log=$2
pdfin=$3
pdfout=$4





#git diff --name-only f39b6fc5fa8eb217f661ba6ecc0a0605ba970eba
#git diff f39b6fc5fa8eb217f661ba6ecc0a0605ba970eba zpevnik_minivlcice.tex | egrep "(PISNICKA|OBRAZEK|NOTY)" | grep "^[+-]"
#
#
#

zmenene_song_soubory=`git diff --name-only $commit songs`

nadpisy=`echo "$zmenene_song_soubory" | xargs grep "begin{TEXT}"|sed 's/^.*TEXT}{\([^}(]\{0,10\}\).*}.*/\1/'|tr '\n' '|'|sed 's/|$//'`

stranky_s_nadpisy=`pdfgrep -n "(${nadpisy})" $pdfin | egrep "^[0-9]*:\s*($nadpisy)"| sed "s/:.*//"|sort |uniq`

stranky_tisk=`
for strana in $stranky_s_nadpisy
do
  [ $((strana%2)) -eq 0 ] && echo $((strana-1))
  echo $strana
  [ $((strana%2)) -eq 1 ] && echo $((strana+1))
done |sort|uniq
`

prvni_stranka=`echo $stranky_tisk | tr " " "\n" | head -n 1`
dalsi_stranky=`echo $stranky_tisk | tr " " "\n" | tail -n +2| tr "\n" ","| sed "s/,$//"`

pdflatex -jobname $pdfout "\def\inputfile{$pdfin} \def\dalsistrany{$dalsi_stranky} \def\prvnistrana{$prvni_stranka} \input{zpevnik_template_2x1.tex}"