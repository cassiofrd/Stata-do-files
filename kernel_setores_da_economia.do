use "C:\Users\Cássio\Dropbox\Trabalho Final Microeconometria\PNADPESS_2002_2012.dta", clear
*calculando o valor do intervalo ótimo para a função de densidade de kernel da RENDMENSALTRABALHOPRINCIPALREAL
sum RENDMENSALTRABALHOPRINCIPALREAL, detail
global sadj = min(r(sd),(r(p75)-r(p25))/1.349)
di "sadj: " $sadj " iqr/1349: " (r(p75)-r(p25))/1.349 " stdev: " r(sd)
global bwepan2 = 1.3643*1.7188*$sadj/(r(N)^0.2)
di "Bandwidth: " $bwepan2

graph twoway (kdensity RENDMENSALTRABALHOPRINCIPALREAL if SETOR_PRIMARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) epan2 clstyle(p2))   (kdensity RENDMENSALTRABALHOPRINCIPALREAL if SETOR_PRIMARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) epan2 clstyle(p1)),  scale (1.2) plotregion(style(none)) title("Setor primario")  xtitle("Rendimento do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "2002") label(2 "2012"))
graph twoway (kdensity RENDMENSALTRABALHOPRINCIPALREAL if SETOR_SECUNDARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) epan2 clstyle(p2))   (kdensity RENDMENSALTRABALHOPRINCIPALREAL if SETOR_SECUNDARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) epan2 clstyle(p1)),  scale (1.2) plotregion(style(none)) title("Setor secundario")  xtitle("Rendimento do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "2002") label(2 "2012"))
graph twoway (kdensity RENDMENSALTRABALHOPRINCIPALREAL if SETOR_TERCIARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) epan2 clstyle(p2))   (kdensity RENDMENSALTRABALHOPRINCIPALREAL if SETOR_TERCIARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) epan2 clstyle(p1)),  scale (1.2) plotregion(style(none)) title("Setor terciario")  xtitle("Rendimento do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "2002") label(2 "2012"))

*calculando o valor do intervalo ótimo para a função de densidade de kernel da LOGRENDMENSTRABALHOPRINCREAL
sum LOGRENDMENSTRABALHOPRINCREAL, detail
global sadj = min(r(sd),(r(p75)-r(p25))/1.349)
di "sadj: " $sadj " iqr/1349: " (r(p75)-r(p25))/1.349 " stdev: " r(sd)
global bwepan2 = 1.3643*1.7188*$sadj/(r(N)^0.2)
di "Bandwidth: " $bwepan2

graph twoway (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_PRIMARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) epan2 clstyle(p2))   (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_PRIMARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) epan2 clstyle(p1)),  scale (1.2) plotregion(style(none)) title("Setor primario")  xtitle("Log do rendimento do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "2002") label(2 "2012"))
graph twoway (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_SECUNDARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) epan2 clstyle(p2))   (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_SECUNDARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) epan2 clstyle(p1)),  scale (1.2) plotregion(style(none)) title("Setor secundario")  xtitle("Log do rendimento do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "2002") label(2 "2012"))
graph twoway (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_TERCIARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) epan2 clstyle(p2))   (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_TERCIARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) epan2 clstyle(p1)),  scale (1.2) plotregion(style(none)) title("Setor terciario")  xtitle("Log do rendimento do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "2002") label(2 "2012"))

*fazendo a função de kernel para os três setores da economia separadamente para cada ano (para o log do rendimento do trabalho principal):
sum LOGRENDMENSTRABALHOPRINCREAL, detail
global sadj = min(r(sd),(r(p75)-r(p25))/1.349)
di "sadj: " $sadj " iqr/1349: " (r(p75)-r(p25))/1.349 " stdev: " r(sd)
global bwepan2 = 1.3643*1.7188*$sadj/(r(N)^0.2)
di "Bandwidth: " $bwepan2

graph twoway (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_PRIMARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) lcolor(green) epan2 clstyle(p1))   (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_SECUNDARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) lcolor(blue) epan2 clstyle(p2)) (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_TERCIARIO==1 & ANO_DE_REFERENCIA==2002, width($bwepan2) lcolor(red) epan2 clstyle(p3)),  scale (1.2) plotregion(style(none)) title("Setores da economia") subtitle("2002") xtitle("Log do rendimento real do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "Setor primário") label(2 "Setor secundário") label(3 "Setor terciário"))
graph twoway (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_PRIMARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) lcolor(green) epan2 clstyle(p1))   (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_SECUNDARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) lcolor(blue) epan2 clstyle(p2)) (kdensity LOGRENDMENSTRABALHOPRINCREAL if SETOR_TERCIARIO==1 & ANO_DE_REFERENCIA==2012, width($bwepan2) lcolor(red) epan2 clstyle(p3)),  scale (1.2) plotregion(style(none)) title("Setores da economia") subtitle("2012") xtitle("Log do rendimento real do trabalho principal", size(medlarge)) xscale(titlegap(*5))  ytitle("Frequência", size(medlarge)) yscale(titlegap(*5))  legend(pos(1) ring(0) col(1)) legend(size(small))  legend( label(1 "Setor primário") label(2 "Setor secundário") label(3 "Setor terciário"))
