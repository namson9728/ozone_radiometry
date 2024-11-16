for Trop_NSCALE in 0.206 0.513 1.00 2.07 4.60; do
    echo "Starting loop for NSCALE=$Trop_NSCALE"
    am MaunaKea_SON_50.amc \
        165 GHz 200 GHz 1 MHz 0 deg 277 K $Trop_NSCALE \
        > trop_h2o_Jacobian_${Trop_NSCALE}.out \
        2> trop_h2o_Jacobian_${Trop_NSCALE}.err
done