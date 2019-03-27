#!/bin/tcsh
setenv PTV_SLEW_LIST "./ptv_list"
setenv REF_SCRIPT "./char_for_allcells.tcl"
setenv CELL_LIST "./cell_list"
setenv ALTOS_QUEUE 0
setenv CDS_CMI_COMPLEVEL 0
mkdir -p ./logs
set time_stamp=`date +%d_%m_%Y:%H_%M`
setenv TMPDIR "./temp"
foreach line (`cat $PTV_SLEW_LIST`)
set ptv=`echo $line | awk -F= '{print $1}'`
#set max_slew=`echo $line | awk -F= '{print $2}'`
liberate $REF_SCRIPT $ptv |& tee ./logs/${ptv}_${time_stamp}.log &
end
