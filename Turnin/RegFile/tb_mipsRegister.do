#########################################################################
## Trent Walraven
## Iowa State University
#########################################################################
## tb_mipsRegister.do
#########################################################################
## DESCRIPTION : This file contains a do file for the testbench for the
## dffg_N unit with N = 32. It adds some useful signals for testing
## functionality and debugging the system. It also formats
## the waveform and runs the simulation.
##
#########################################################################

# Setup the wave form with useful signals
# Create a new header defining the dataflow being tested
add wave -noupdate -divider "TB for tb_mipsRegister"

# Create a section for inputs
add wave -noupdate -divider {Inputs}
add wave -noupdate -label Clock /tb_mipsRegister/CLK
add wave -noupdate -label Reset /tb_mipsRegister/s_RST
add wave -noupdate -label WriteEnable /tb_mipsRegister/s_WE
add wave -noupdate -label WriteSelect /tb_mipsRegister/s_WRITEADDR
add wave -noupdate -label Read1Select /tb_mipsRegister/s_READADDR1
add wave -noupdate -label Read2Select /tb_mipsRegister/s_READADDR2
add wave -noupdate -label dataInput /tb_mipsRegister/s_D


# Create a section for outputs
add wave -noupdate -divider {Output}
add wave -noupdate -label Read1Out /tb_mipsRegister/s_READ1
add wave -noupdate -label Read2Out /tb_mipsRegister/s_READ2

# Create a sections that houses all internal signals
add wave -noupdate -divider {others}
add wave -noupdate /tb_mipsRegister/DUT0/*

# Run for 1000 timesteps (default is 1ns per timestep, but this can be modified so be aware).
run 1500 