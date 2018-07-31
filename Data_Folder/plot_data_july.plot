set grid
set xrange [1e3:1e9]
set yrange [1e3:1e9]
set key bottom right font "Courier,22" box on
set xtics font "Courier,22"
set ytics font "Courier,22"
set xlabel "AFG Frequency (Hz)" font "Courier,22" offset 0,-0.5
set ylabel "Measured Frequency (Hz)" font "Courier,22" offset -2.75,0
set pointsize 2
set logscale x
set logscale y
set format y "10^{%1.1T}"
set format x "10^{%1.1T}"
set bmargin 5
f(x) = x
set terminal postscript color enhanced
set output "July31_plot1.eps"

plot "JulyData2018_ClockWizard_32bitRegister.dat" using 1:3 w p pt 6 lc -1 title "Spartan 6 Data, Custom Clock", f(x) lt 3 lc -1 title "y = x"
