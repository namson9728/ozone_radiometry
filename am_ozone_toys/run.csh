#! /bin/tcsh -f

foreach file (`echo MaunaKea_*.amc`)
    cat header.amc > temp.amc
    cat $file | awk '{if (NR >= 45) print $0}' >> temp.amc
end

exit 0