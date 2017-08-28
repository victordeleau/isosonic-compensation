#!/bin/bash
# Script bash gnuplot permettant de tracer toutes les courbes en png 1080p à partir des .csv

gnuplot -persist <<-EOFMarker
  set datafile separator  "," # Pour lire les .csv
  set xrange [0:30]
  #set xlabel "Frèquence (Hertz)"
  set yrange [-10:140]
  #set ylabel "Niveau Relatif (dB)"
 
  unset key # Pour supprimer les légende des courbes , moche

  set terminal png size 3840,2160 enhanced font "Helvetica,40" # Paramètres d'export png
  set output 'carve/c_origin.png'
  #set xtics ("20" 0, "25" 1, "31.5" 2, "40" 3, "50" 4, "63" 5, "80" 6, "100" 7, "125" 8, "160" 9, "200" 10, "250" 11, "315" 12, "400" 13, "500" 14, "630" 15, "800" 16, "1000" 17, "1250" 18, "1600" 19, "2000" 20, "2500" 21, "3150" 22, "4000" 23, "5000" 24, "6300" 25, "8000" 26, "10000" 27, "12500" 28, "16000" 29, "20000" 30)
  set xtics ("" 0, "" 1, "" 2, "" 3, "" 4, "" 5, "" 6, "" 7, "" 8, "" 9, "" 10, "" 11, "" 12, "" 13, "" 14, "" 15, "" 16, "" 17, "" 18, "" 19, "" 20, "" 21, "" 22, "" 23, "" 24, "" 25, "" 26, "" 27, "" 28, "" 29, "" 30)
  # xtics permet de changer la graduation en x

  plot for [i=1:9] 'carve/c_origin.csv' using 0:(column(i)) with lines lw 4

  set output 'carve/c_itrp.png'

  plot for [i=1:90] 'carve/c_itrp.csv' using 0:(column(i)) with lines lw 4

  set yrange [-10:90]
  set output 'carve/c_flat.png'

  plot for [i=1:90] 'carve/c_flat.csv' using 0:(column(i)) with lines lw 4

  set yrange [-10:50]
  set output 'carve/c_matrice.png'

  plot for [i=1:90] 'carve/c_matrice.csv' using 0:(column(i)) with lines lw 3


EOFMarker
