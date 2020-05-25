
prepare-minivlcice:
	cd score;for noty in *.ly ; do \
      lilypond -dbackend=eps $$noty ; \
    done
	xelatex zpevnik_minivlcice.tex
	LC_ALL=cs_CZ.UTF-8 texlua songidx.lua minivlciceidx.sxd minivlciceidx.sbx

minivlcice: prepare-minivlcice
	xelatex '\input{zpevnik_minivlcice.tex}'
	pdflatex zpevnik_minivlcice_2x1.tex
	echo showpage | ps2pdf -sPAPERSIZE=a4 - blank_a4.pdf
	pdftk A=zpevnik_minivlcice.pdf B=blank_a4.pdf cat B1 A1-end output - | pdfnup --nup 2x2 --no-landscape --scale 0.95 --outfile 'zpevnik_minivlcice_nahledy.pdf'  '/dev/stdin'

minivlcice-draft: prepare-minivlcice
	xelatex '\def\draft{}\input{zpevnik_minivlcice.tex}'
	pdflatex zpevnik_minivlcice_2x1.tex
	echo showpage | ps2pdf -sPAPERSIZE=a4 - blank_a4.pdf
	pdftk A=zpevnik_minivlcice.pdf B=blank_a4.pdf cat B1 A1-end output - | pdfnup --nup 2x2 --no-landscape --scale 0.95 --outfile 'zpevnik_minivlcice_nahledy.pdf'  '/dev/stdin'


publish: minivlcice
	cp zpevnik_minivlcice.pdf docs/zpevnik_minivlcice.pdf
	git add -f docs/zpevnik_minivlcice.pdf
	git commit docs -m $(shell date '+"publishing %Y-%m-%d"')
	git push

publish-draft: minivlcice-draft
	cp zpevnik_minivlcice.pdf docs/zpevnik_minivlcice_draft.pdf
	git add -f docs/zpevnik_minivlcice_draft.pdf
	git commit docs -m $(shell date '+"publishing draft %Y-%m-%d"')
	git push