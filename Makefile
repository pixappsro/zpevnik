
prepare-minivlcice:
	cd score;for noty in *.ly ; do \
      lilypond -dbackend=eps $$noty ; \
    done
	xelatex zpevnik_minivlcice.tex
	LC_ALL=cs_CZ.UTF-8 texlua songidx.lua minivlciceidx.sxd minivlciceidx.sbx

minivlcice: prepare-minivlcice
	xelatex '\input{zpevnik_minivlcice.tex}'

minivlcice-draft: prepare-minivlcice
	xelatex '\def\draft{}\input{zpevnik_minivlcice.tex}'

minivlcice-final-print: minivlcice
	pdflatex zpevnik_minivlcice_2x1.tex
	echo showpage | ps2pdf -sPAPERSIZE=a4 - blank_a4.pdf
	pdftk A=zpevnik_minivlcice.pdf B=blank_a4.pdf cat B1 A1-end output - | pdfnup --nup 2x2 --no-landscape --scale 0.95 --outfile 'zpevnik_minivlcice_nahledy.pdf'  '/dev/stdin'

minivlcice-publish: minivlcice
	cp zpevnik_minivlcice.pdf docs/zpevnik_minivlcice.pdf
	git add -f docs/zpevnik_minivlcice.pdf
	git commit docs/zpevnik_minivlcice*.pdf -m $(shell date '+"publishing minivlcice %Y-%m-%d"')
	git push

minivlcice-publish-draft: minivlcice-draft
	cp zpevnik_minivlcice.pdf docs/zpevnik_minivlcice_draft.pdf
	git add -f docs/zpevnik_minivlcice_draft.pdf
	git commit docs/zpevnik_minivlcice*.pdf -m $(shell date '+"publishing draft minivlcice %Y-%m-%d"')
	git push


minivlcice-diff-2019: minivlcice-final-print
	./create_updated_pages_pdf.sh f39b6fc5fa8eb217f661ba6ecc0a0605ba970eba zpevnik_minivlcice.log zpevnik_minivlcice.pdf zpevnik_minivlcice_2x1_diff2019

minivlcice-diff-2020: minivlcice-final-print
	./create_updated_pages_pdf.sh 333dcd20b2bd501f27237442e4ee261c74c65d6a zpevnik_minivlcice.log zpevnik_minivlcice.pdf zpevnik_minivlcice_2x1_diff2020


rosomak:
	xelatex zpevnik_rosomak.tex
	xelatex zpevnik_rosomak.tex
	xelatex zpevnik_rosomak.tex

rosomak-publish: rosomak
	pdflatex -jobname zpevnik_rosomak_2x1 '\def\inputfile{zpevnik_rosomak.pdf} \def\prvnistrana{1} \input{zpevnik_template_2x1.tex}'
	pdflatex zpevnik_rosomak_2x2.tex
	cp zpevnik_rosomak.pdf docs/zpevnik_rosomak.pdf
	cp zpevnik_rosomak_2x1.pdf docs/zpevnik_rosomak_2x1.pdf
	cp zpevnik_rosomak_2x2.pdf docs/zpevnik_rosomak_2x2.pdf
	git add -f docs/zpevnik_rosomak.pdf
	git add -f docs/zpevnik_rosomak_2x1.pdf
	git add -f docs/zpevnik_rosomak_2x2.pdf
	git commit docs/zpevnik_rosomak*.pdf -m $(shell date '+"publishing rosomak %Y-%m-%d"')
	git push









#	./create_updated_pages_pdf.sh f39b6fc5fa8eb217f661ba6ecc0a0605ba970eba zpevnik_minivlcice.log zpevnik_minivlcice_2x1.pdf zpevnik_minivlcice_2x1_diff2019.pdf




# vygrepne nadpisy
# git diff --name-only f39b6fc5fa8eb217f661ba6ecc0a0605ba970eba songs | xargs grep "begin{TEXT}"|sed 's/^.*TEXT}{\([^}(]\{0,10\}\).*}.*/\1/'|tr '\n' '|'|sed 's/|$//'
#
# pdfgrep -n "(${NADPISY})" zpevnik_minivlcice.pdf
#
# je ale potřeba se kouknout i na konec písničky pro případ vícestránkových písniček !!!