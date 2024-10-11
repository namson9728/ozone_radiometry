set style line 1 lt 1 dt 1 lc rgbcolor "blue"
set style line 2 lt 1 dt 2 lc rgbcolor "blue"
set style line 3 lt 1 dt 3 lc rgbcolor "blue"
# set style line 1 lt 1 dt 1 lc rgbcolor "0x396ab1"
# set style line 2 lt 1 dt 1 lc rgbcolor "0x396ab1"
# set style line 3 lt 1 dt 1 lc rgbcolor "0x396ab1"
set style line 4 lt 1 dt 1 lc rgbcolor "gray40"
set style line 5 lt 1 dt 2 lc rgbcolor "gray40"
set style line 6 lt 1 dt 3 lc rgbcolor "gray40"
# set style line 4 lt 1 dt 1 lc rgbcolor "0xda7c30"
# set style line 5 lt 1 dt 1 lc rgbcolor "0xda7c30"
# set style line 6 lt 1 dt 1 lc rgbcolor "0xda7c30"
set style line 7 lt 1 dt 1 lc rgbcolor "0x3e9651"
set style line 8 lt 1 dt 2 lc rgbcolor "0x3e9651"
set style line 9 lt 1 dt 3 lc rgbcolor "0x3e9651"
set style line 10 lt 1 dt 1 lc rgbcolor "black"
set style line 11 lt 1 dt 1 lc rgbcolor "black"
set style line 12 lt 1 dt 2 lc rgbcolor "black"
set style line 13 lt 1 dt 3 lc rgbcolor "white"


set terminal pngcairo enhanced rounded lw 4 font "Arial, 48" size 2700,1800

#
# Basic Tb spectrum at 20 UT from 18 UT forecast
#

set output '2019Apr30_20_Tb.png'

set key at graph 0.25,0.9
set title 'SMA - 2019 Apr 30 from 18 UT forecast'
set xr [210 to 250]
set xlabel 'frequency [GHz]'
set xtics 10
set mxtics 2
set yr [25 to 75]
set ylabel 'zenith T_b [K]'

set arrow from 225.896,31 to 225.896,33 nohead
set label 'HDO' at 225.896,29 center
set arrow from 241.561,31 to 241.561,33 nohead
set label 'HDO' at 241.561,29 center
set arrow from 233.946,31 to 233.946,33 nohead
set label 'O^{18}O' at 233.946,29 center
set arrow from 226.054,42 to 226.054,44 nohead
set label 'O_3' at 226.054,46 center

plot \
    '2019Apr30_20_0.out' using 1:2 with lines ls 1 t '20 UT'

set output
unset arrow
unset label

#
# dTb / dpwv at 20 UT.
#

PWV_SCALE = 2.372  # mm from 2019Apr30_20_0.err

set output '2019Apr30_20_dTb_dPWV.png'

set yr [9.5 to 12.5]
set ytics 1
set mytics 2
set ylabel 'zenith dT_b / dPWV [K⋅mm^{-1}]'
plot \
    '2019Apr30_20_0.out' using 1:($4 / PWV_SCALE) with lines ls 1 t '20 UT'

set output

#
# zenith dL / dPWV at 20 UT
#

set output '2019Apr30_20_dL_dTsys.png'

set yrange [0.5 to 1]
set ytics 0.1
set ylabel 'zenith (dL / dPWV)(dT_{sys} / dPWV)^{-1} [mm⋅K^{-1}]'

plot \
    '2019Apr30_20_0.out' using 1:($6 / $4) with lines ls 1 t '20 UT'

set output

#
# dL / dPWV at 19,20,21 UT to zenith
#

set output '2019Apr30_all_0_dL_dTsys.png'

set yrange [0.5 to 1]
set ytics 0.1
set ylabel 'zenith (dL / dPWV)(dT_{sys} / dPWV)^{-1} [mm⋅K^{-1}]'

plot \
    '2019Apr30_19_0.out' using 1:($6 / $4) with lines ls 4 t '19 UT', \
    '2019Apr30_20_0.out' using 1:($6 / $4) with lines ls 1 t '20 UT', \
    '2019Apr30_21_0.out' using 1:($6 / $4) with lines ls 7 t '21 UT'
    

set output

#
# dL / dPWV at 19,20,21 UT for three zenith angles
#

set output '2019Apr30_all_dL_dTsys.png'

set yrange [0.5 to 0.95]
set ytics 0.1
set ylabel '(dL / dPWV)(dT_{sys} / dPWV)^{-1} [mm⋅K^{-1}]'

set label 1 "θ_z [deg]" at 220,0.76 center
set label 2 "60" at 220,0.73 center
set label 3 "45" at 220,0.682 center
set label 4 "0" at 220,0.649 center

plot \
    '2019Apr30_19_0.out'  using 1:($6 / $4) with lines ls 4 t '19 UT', \
    '2019Apr30_19_45.out' using 1:($6 / $4) with lines ls 4 notitle, \
    '2019Apr30_19_60.out' using 1:($6 / $4) with lines ls 4 notitle, \
    '2019Apr30_20_0.out'  using 1:($6 / $4) with lines ls 1 t '20 UT', \
    '2019Apr30_20_45.out' using 1:($6 / $4) with lines ls 1 notitle, \
    '2019Apr30_20_60.out' using 1:($6 / $4) with lines ls 1 notitle, \
    '2019Apr30_21_0.out'  using 1:($6 / $4) with lines ls 7 t '21 UT', \
    '2019Apr30_21_45.out' using 1:($6 / $4) with lines ls 7 notitle, \
    '2019Apr30_21_60.out' using 1:($6 / $4) with lines ls 7 notitle
    

set output

#
# Vane calibration correction. Simulation of 290 K load outside the
# atmosphere.
#

unset label 1
unset label 2
unset label 3
unset label 4
unset key

set label 1 'Actual cal load temperature' at 220,290.5
set label 2 'Simulated cal load behind atmosphere' at 220,288
set output '2019Apr30_290K_sim_cal.png'

set auto y

set yrange [277.5 to 292.5]
set ytics 5
set ylabel 'T_b [K]'

plot \
    '2019Apr30_290K_sim_cal.out' using 1:2 with line ls 1, \
    (290.) with line ls 2

set output
