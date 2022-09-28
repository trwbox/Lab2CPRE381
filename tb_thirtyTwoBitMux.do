#########################################################################
## Trent Walraven
## Iowa State University
#########################################################################
## tb_thirtyTwoBitMux.do
#########################################################################
## DESCRIPTION : This file contains a do file for the testbench for the
## dffg_N unit with N = 32. It adds some useful signals for testing
## functionality and debugging the system. It also formats
## the waveform and runs the simulation.
##
#########################################################################

# Setup the wave form with useful signals
# Create a new header defining the dataflow being tested
add wave -noupdate -divider "TB for tb_thirtyTwoBitMux"
add wave -noupdate -divider "N=32"

# Create a section for inputs
add wave -noupdate -divider {Inputs}
add wave -noupdate -label Input /tb_thirtyTwoBitMux/s_IN
add wave -noupdate -label Enable /tb_thirtyTwoBitMux/s_EN


# Create a section for outputs
add wave -noupdate -divider {Output}
add wave -noupdate -label DataOut /tb_thirtyTwoBitMux/s_OUT

# Create a sections that houses all internal signals
add wave -noupdate -divider {others}
add wave -noupdate /tb_thirtyTwoBitMux/DUT0/*

# Run for 500 timesteps (default is 1ns per timestep, but this can be modified so be aware).
run 1000 