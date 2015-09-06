.PHONY : diss

diss : kimtext.ps kimpics.ps

kimdiss.ps : main.dvi
	dvips -x 0700 -t landscape -o $(HOME)/bigtmp/disstmp.ps main
	pstops '2:0(0.5cm,0.6cm)+1(0.5cm,-14.05cm)' $(HOME)/bigtmp/disstmp.ps $(HOME)/bigtmp/kimdiss.ps

kimtext.ps : main.dvi
	dvips -x 0700 -O '-0.7cm,7.5cm' -pp 0-168 -o kimtext.ps main

kimpics.ps : main.dvi
	dvips -x 0700 -O '2.3cm,4.5cm' -pp 169,171,173,175,177,179 -o kimpics.ps main

kimp080.ps : main.dvi
	dvips -x 0700 -O '2.3cm,4.5cm' -pp 169,171,173,175,177,179 -c 80 -o kimp080.ps main

main.dvi : main.tex einleit.tex defs.tex material.tex simspecs.tex methoden.tex lndga.tex lnd2.tex lnd5.tex lnd53d.tex zfassung.tex lit.tex anhang.tex
	latex main
	latex main
