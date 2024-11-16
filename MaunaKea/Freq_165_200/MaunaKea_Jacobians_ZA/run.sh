for ZENITH_ANGLE in 0 45 60 70; do
    echo "Starting loop for ZENITH=$ZENITH_ANGLE"
    am MaunaKea_SON_50.amc \
        165 GHz 200 GHz 1 MHz $ZENITH_ANGLE deg 277 K 1.0 \
        > trop_h2o_Jacobian_${ZENITH_ANGLE}.out \
        2> trop_h2o_Jacobian_${ZENITH_ANGLE}.err
done