set cell_list_file $env(CELL_LIST)
#set cell_list_file "/home/sgeuser66/TMSY/CHAR_NLDM_NLPM_CCS_CCSN_CCSP_ECSM_ECSMN/NLDM_NLPM/cell_list.tcl"
set fp [open $cell_list_file r]
set file_data [read $fp]
close $fp
set cells_o [split $file_data "\n"] 
set cells [lreplace $cells_o end end]
puts "TESTING PURPOSE: cell_list is $cells" 
set rundir $env(PWD) 
set ptv [lindex $argv 0]
exec mkdir -p ${rundir}/ldb
exec mkdir -p ${rundir}/lib
exec mkdir -p ${rundir}/datasheet
exec mkdir -p ${rundir}/checkpointdir/$ptv
set lptv [split $ptv {_}]
set_operating_condition -voltage [lindex $lptv 2] -temp [lindex $lptv 1]
source ${rundir}/param.tcl
source ${rundir}/template.tcl
set_var ldb_checkpoint_dir ${rundir}/checkpointdir/$ptv
switch -exact [lindex $lptv 0] {

NN     {
		set spicefiles ${rundir}/models/NN.scs
		set_var extsim_model_include ${rundir}/models/NN.scs

		set_default_group \
		-criteria {delay max power min leakage avg cap max}\
		-method {default bitwise const bitwise} \
		-unateness merge
		
		set_pin_capacitance \
		-state avg \
		-table avg \
		-direction avg
		
		}




	SS     {
		set spicefiles ${rundir}/models/ss.scs
		set_var extsim_model_include ${rundir}/models/ss.scs

		set_default_group \
		-criteria {delay max power min leakage avg cap max}\
		-method {default bitwise const bitwise} \
		-unateness merge
		
		set_pin_capacitance \
		-state avg \
		-table avg \
		-direction avg
		
		}

	TT     {
		set spicefiles ${rundir}/models/tt.scs
		set_var extsim_model_include ${rundir}/models/tt.scs

		set_default_group \
		-criteria {delay max power min leakage avg cap max}\
		-method {default bitwise const bitwise} \
		-unateness merge
		
		set_pin_capacitance \
		-state avg \
		-table avg \
		-direction avg
		
		}
	
	FF     {
		set spicefiles ${rundir}/models/ff.scs
		set_var extsim_model_include ${rundir}/models/ff.scs

		set_default_group \
		-criteria {delay max power max leakage avg cap max}\
		-method {default bitwise const bitwise} \
		-unateness merge
		
		set_pin_capacitance \
		-state avg \
		-table avg \
		-direction avg
		
		}
	default  {
		  puts "Wrong PTV name"
		  exit
		 }
}
if { [ packet_slave_cells ] != "" } {

                set cells [ packet_slave_cells ]

}

foreach cell $cells {


        #lappend spicefiles /home/sgeuser66/TMSY/backup/spef/$cell.dspf
	lappend  spicefiles /home/vv2trainee2/Desktop/Deekshith/std_character/7x7_template_new/spec/${cell}.spef
	#lappend spicefiles /home/sgeuser66/TMSY/backup/all_lvs/${cell}.spi
	#lappend spicefiles /home/sgeuser66/TMSY/backup/all_gds/${cell}.gds
	#lappend spicefiles ${rundir}/extracted_netlist/${cell}.sp
	#lappend spicefiles ${rundir}/extracted_netlist/${cell}.spi ;#for extracted netlist(.sp)
	
	 lappend spicefiles ${rundir}/netlist/${cell}.cdl
         #lappend spicefiles ${rundir}/netlist/${cell}.scs ;#for extracted netlist(.sp)
         #lappend spicefiles ${rundir}/netlist/CDL_netlist_75.scs ;#for CDL netlist(.scs)
}

set_var extsim_flatten_netlist 0
set_var parse_auto_define_leafcell 0



define_leafcell -type pmos -pin_position {0 1 2 3} { pmos1v }
define_leafcell -type nmos -pin_position {0 1 2 3} { nmos1v }

#define_leafcell -type pmos -pin_position {0 1 2 3} { pmos1v } 
#define_leafcell -type nmos -pin_position {0 1 2 3} { nmos1v } 


read_spice -format spectre $spicefiles


exec mkdir -p ${rundir}/decks/$ptv
exec mkdir -p ${rundir}/verilog

set_var extsim_deck_dir ${rundir}/decks/$ptv/
set_var extsim_deck_dir [file normalize "decks"] 
set_var extsim_save_failed all ;#save failed cases only
set_var extsim_save_passed all
set_var extsim_save_verify 2 ;#Generates additional SPICE decks to verify setup, hold,recovery and/or removal

set_var extsim_exclusive 1
set_var sim_estimate_duration 0 

set n_bias 0.0
#set_gnd -type pwell "VSS!" $n_bias
#set_gnd -type pwell "VPW!" $n_bias

set_gnd -type pwell "VSS" $n_bias
set_gnd -type pwell "VPW" $n_bias

#set_vss -type pwell "vss" $n_bias


set p_bias "[lindex $lptv 2]" 
#set_vdd -type nwell "VDD!" $p_bias
#set_vdd -type nwell "VNW!" $p_bias

set_vdd -type nwell "VDD" $p_bias
set_vdd -type nwell "VNW" $p_bias

#set_vdd -type nwell "vdd" $p_bias

set_var voltage_map 1




set THREADS 30
set_var packet_clients 0
set_var packet_mode arc
set packet_arcs_per_thread_auto_adjust 0


##### Set CCSN variables
##### For Noise Characterization use this 

#set CCST_CAP                    "C1CN"; # C1C2, C1CN
#set CCSN_CHAR			"BOTH" ; # BOTH=old ccsn & new ccsn in ldb
#set CCSN_MODEL                  "REFERENCED"; # STAGE=old ccsn (ccsn_first|last_stage), REFERENCED=new ccsn (input|output_ccb),



#set_var user_data_ignore "$cells"
#set_var user_data_override {max_capacitance cell_leakage_power}


############### Characterize the library for NLDM.
###NLDM and NLPM
char_library  -thread $THREADS -extsim spectre -cells $cells -auto_index
#char_library  -thread $THREADS -extsim spectre -cells $cells 

###CCS and CCSN
char_library -si -extsim spectre -cells $cells -thread $THREADS
#char_library -si -ccs -ccsn -ccsp -extsim spectre -cells $cells -thread $THREADS
#char_library -ccs -ccsn -ccsp -extsim spectre -cells $cells -thread $THREADS

###ECSM and ECSMN
#char_library -ecsm -ecsmn -extsim spectre -cells $cells -thread $THREADS -auto_index
#char_library -ecsm -ecsmn -extsim spectre -cells $cells -thread $THREADS 


############# Save characterization database for post-processing ##
write_ldb -overwrite ${rundir}/ldb/${ptv}.ldb
#write_ldb -overwrite ${rundir}/ldb/${ptv}.ldb

################## Generate a .lib ###
#first run ccs if not you will get error
write_library -driver_waveform -unique_pin_data -bus_syntax {[]} -user_data ${rundir}/userdata.lib -ccs -ccsn -ccsp -overwrite -filename ${rundir}/lib/${ptv}_ccs.lib ${ptv} 
#write_library -driver_waveform -unique_pin_data -bus_syntax {[]} -user_data ${rundir}/userdata.lib -si -overwrite -filename ${rundir}/lib/${ptv}_si.lib ${ptv} 
write_library -overwrite -filename ${rundir}/lib/${ptv}_NLDM.lib ${ptv} 

#write_library -driver_waveform -unique_pin_data -bus_syntax {[]} -user_data ${rundir}/userdata.lib -ecsm -ecsmn -overwrite -filename ${rundir}/lib/${ptv}_ecsm.lib ${ptv}

################# Generate ascii datatsheet ###

write_datasheet -format html -dir ${rundir}/datasheet/${ptv} -include_indices -conditional -filename ${ptv} ${ptv}
write_verilog ${rundir}/verilog/${ptv}.v




