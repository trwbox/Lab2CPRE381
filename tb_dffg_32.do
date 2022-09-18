#########################################################################
## Trent Walraven
## Iowa State University
#########################################################################
## tb_dffg_32.do
#########################################################################
## DESCRIPTION : This file contains a do file for the testbench for the
## dffg_N unit with N = 32. It adds some useful signals for testing
## functionality and debugging the system. It also formats
## the waveform and runs the simulation.
##
#########################################################################

# Setup the wave form with useful signals
# Create a new header defining the dataflow being tested
add wave -noupdate -divider "TB for dffg_N"
add wave -noupdate -divider "N=32"

# Create a section for inputs
add wave -noupdate -divider {Inputs}
add wave -noupdate -label CLK /tb_dffg_32/CLK
add wave -noupdate -label RST /tb_dffg_32/s_RST
add wave -noupdate -label WE /tb_dffg_32/s_WE
add wave -noupdate -label DataIn /tb_dffg_32/s_D


# Create a section for outputs
add wave -noupdate -divider {Output}
add wave -noupdate -label DataOut /tb_dffg_32/s_OUT

# Create a sections that houses all internal signals
add wave -noupdate -divider {others}
add wave -noupdate /tb_dffg_32/DUT0/*

# Run for 500 timesteps (default is 1ns per timestep, but this can be modified so be aware).
run 500 