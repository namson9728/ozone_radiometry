cat header.amc 2019Apr30_18f001.amc > 2019Apr30_19.amc
cat header.amc 2019Apr30_18f002.amc > 2019Apr30_20.amc
cat header.amc 2019Apr30_18f003.amc > 2019Apr30_21.amc

DATE=2019Apr30
for HOUR in 19 20 21; do
    for ZA in 0 45 60; do
        BASENAME=${DATE}_${HOUR}_${ZA}
        am 2019Apr30_${HOUR}.amc $ZA >${BASENAME}.out 2>${BASENAME}.err
    done
done

am 2019Apr30_290K_sim_cal.amc \
        > 2019Apr30_290K_sim_cal.out 2> 2019Apr30_290K_sim_cal.err
