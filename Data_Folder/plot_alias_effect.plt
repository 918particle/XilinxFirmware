set grid
set pointsize 2
set xtics font "Courier,20"
set ytics font "Courier,20"
set xlabel "f_{AFG} (MHz)" font "Courier,20"
set ylabel "f_{Meas} (MHz)" font "Courier,20"
set logscale x
set logscale y
set xrange [0.5:100]
set yrange [1e-3:100]
set key bottom left box on font "Courier,18"
set arrow from 20,1e-3 to 20,1e2 nohead lc -1
set label 1 "Comparison Clock Freq." at 2,50 font "Courier,20"
set terminal postscript color enhanced
set output "Aug7_plot1.eps"

plot "fAFG_fMeas_20MHz_20MHzCounter.dat" using 1:2 w lp pt 6 lc -1 lw 2 title "20 MHz Clock no 100 MHz Counter", \
"fAFG_fMeas_20MHz_100MHzCounter.dat" using 1:2 w lp pt 5 lc -1 lw 2 title "20 MHz Clock w/ 100 MHz Counter"
