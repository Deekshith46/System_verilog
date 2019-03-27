set_var force_condition 4 ;# always output when condition
set_var sdf_cond_style 1 ;#Generates an SDF variable name from the "when" condition for all complex conditions and for all conditional constraints
#set_var sdf_cond_style_for_constraints 0
set_var sdf_cond_equals "=="
set_var ldb_precision 8
#set_var parse_ignore_duplicate_subckt 1 ;#ignores the dupilcate subckt
#set_var extsim_cmd_option "-cp +spice +rcopt=2 +liberate +lqt 0 +lorder MMSIM:PRODUCT"

###############################simulator settings#######################################################
set_var extsim_cmd_option "+spice"
set_var extsim_deck_header "simulator lang=spectre\nSetOption1 options \nsimulator lang=spice"


#set_var extsim_deck_header "simulator lang=spectre\n SetOption1 options simulator lang=spice"

set_var extsim_option "method=gear gmin=1e-15 gmindefault=gmindc redefinedparams=ignore save=nooutput"
set_var extsim_leakage_option "method=gear gmin=1e-15 gmindefault=gmindc redefinedparams=ignore save=nooutput"
set_var extsim_cmd /tools/cadence/SPECTRE171/tools/bin/spectre
set_var extsim_leakage /tools/cadence/SPECTRE171/tools/bin/spectre




#set_var extsim_deck_header "simulator lang=spice\nSetOption1 options \nsimulator lang=spectre"

#set_var extsim_cmd /tools/cadence_march2021/SPECTRE201/tools.lnx86/bin/spectre
#set_var extsim_leakage /tools/cadence_march2021/LIBERATE201/tools/bin/liberate

#set_var delay_inp_rise 0.5
#set_var delay_inp_fall 0.5
#set_var delay_out_rise 0.5
#set_var delay_out_fall 0.5

##################################Based on supply voltages for respective corners##############################################################
set_var measure_cap_lower_rise 0.01 ;#1% of VDD
set_var measure_cap_upper_rise 0.99 ;#99% of VDD
set_var measure_cap_lower_fall 0.01 ;#1% of VDD
set_var measure_cap_upper_fall 0.99 ;#%99% of VDD
set_var mpw_input_threshold 0.9 ;#90% of VDD

set_var conditional_arc 1 ;#Outputs conditional arcs 
set_var combinational_risefall 1
set_var default_unateness separate

set_var extsim_deck_dir [file normalize "decks"] 
#set_var extsim_save_failed all
#set_var extsim_saved_passed all
set_var extsim_exclusive 1
set_var sim_estimate_duration 0


set_var conditional_expression separate ;#ensures all the arcs are present

#set_var disable_method 2  ;#tristate devices
#set_var disable_current_measure_effort 1
set_var conditional_constraint 1 ;#to calculate the timing constarints for worst condition
set_var constraint_delay_degrade_abstol 1e-12 ;#for high performance designs the recommended value is 2e-12
set_var constraint_search_time_abstol 2e-12
set_var constraint_snap_to_bound 1
set_var constraint_delay_degrade 0.1
#set_var constraint_clock_gater 1
set_var reset_negative_constraint 0
#set_var constraint_combinational 0
set_var constraint_delay_degrade_abstol_max 60e-12
set_var constraint_glitch_hold 0
set_var constraint_glitch_peak 0.2
set_var constraint_glitch_peak_internal 0.2
set_var constraint_glitch_peak_mode 0
#set_var predriver_waveform 2
#set_var constraint_linear_waveform 1
#set_var mpw_linear_waveform 1


set_var constraint_output_load min
set_var constraint_slew_degrade -1
set_var mpw_criteria delay
set_var mpw_table 1
set_var constraint_check_final_state 3
set_var mpw_delay_use_active_edge 1

set_var toggle_leakage_state 1
set_var power_subtract_output_load all
set_var power_combinational_include_output 0
set_var power_sequential_include_complementary_output 0
set_var hidden_power 1
set_var leakage_add_input_pin 1
set_var leakage_mode 1
set_var force_default_group 0
set_var max_transition_for_outputs max
set_var conditional_include_output 0

set_units -capacitance  1pf -current  1ma -leakage_power 1uw -pulling_resistance 1kohm -timing 1ns


###################
set_var capacitance_force_hidden 1

set_var voltage_map                         1	;# create pg_pin groups, related_power_pin / related_ground_pin

#set_var pin_based_power                     0	;# Monitor power based on Vdd pin only

set_var pin_based_power                     2	;# Monitor power based on Vdd pin only

set_var power_multi_output_binning_mode	    1   

#set_var power_subtract_leakage              4	;# use 4 for cells with exhaustive leakage states.

set_var power_subtract_leakage              1	;# use 4 for cells with exhaustive leakage states.
set_var subtract_hidden_power               2   ;# subtract hidden power for all cells



if 0 {
# CCST
#set_var ccs_abs_tol  1.00E-13
#set_var ccs_rel_tol  0.009
#set_var ccs_voltage_tail_tol  0.981
#set_var ccs_cap_use_input_transition  2
#set_var ccs_cap_hidden_pin  2
#set_var ccs_force_grid_delay  1
#set_var ccs_max_pts  50
#set_var ccs_voltage_tail_trim_tol  0.999
#set_var ccs_base_curve_points  15
#set_var ccs_base_curve_share_mode  2
#set_var ccs_cap_duplicate_risefall -1
#set_var ccs_init_voltage_comp_thresh 1.1
#set_var ccs_voltage_waveform_style compact
#set_var ccs_cap_enhancement_format_mode 0
#set_var ccs_correct_current_by_area 0
#set_var ccs_waveform_smooth_mode 0
#set_var default_rcvr_cap_groupwise 1


# CCSN 
set_var ccsn_arc_channel_check 3
set_var ccsn_check_valid_noise_prop 3
set_var ccsn_dc_static_check 3
set_var ccsn_dc_static_check_mode 0
set_var ccsn_miller_vin_mode 1
set_var ccsn_prefer_two_sided_stages 2
set_var ccsn_consistent_side_inputs 1
#_consider_ccb_only 1
set_var ccsn_default_conditional_check 1
set_var ccsn_part_mode_initialize_internal 1
set_var ccsn_probe_non_gate 1
set_var ccsn_prop_tristate_meas_mode 1
set_var ccsn_side_ccb_model_mode 1
set_var ccsn_include_passgate_attr 0
set_var ccsn_model_related_node_attr 1
set_var ccsn_pin_stage_lshift 0
set_var ccsn_dc_template_size  29
set_var ccsn_use_output_voltage_level 1
set_var ccsn_print_is_needed_if_false_attr_value 1
set_var ccsn_slew_based_output_voltage 2
set_var ccsn_sort_merge_hidden_mode 0
set_var ccsn_switch_cell_partition_mode 0
#set_var -pin {CDN SDN} ccsn_part_mode 1

### Capacitance ###
set_var min_capacitance_for_outputs            1        ;# write min_capacitance attribute for output pins
# set_var measure_cap_lower_rise                 0
# set_var measure_cap_upper_rise                 0.5
# set_var measure_cap_upper_fall                 1
# set_var measure_cap_lower_fall                 0.5
}


set_var parse_ignore_duplicate_subckt 1
set_var user_data_apply_after_ldb_processing 0
set_var tmpdir ${rundir}/temp
