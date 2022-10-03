add wave -noupdate -divider {Special}
add wave -noupdate -label CLK tb_secondDataPath/CLK

add wave -noupdate -divider "{Single Bit Inputs}"
add wave -noupdate -label RESET tb_secondDataPath/s_RST
add wave -noupdate -label nAdd_Sub tb_secondDataPath/s_nAdd_Sub
add wave -noupdate -label ALUSrc tb_secondDataPath/s_ALUSrc
add wave -noupdate -label mem_read tb_secondDataPath/s_mem_read
add wave -noupdate -label mem_write tb_secondDataPath/s_mem_write


add wave -noupdate -divider "{Multi-Bit Inputs}"
add wave -noupdate -radix unsigned -label ReadRegister1 tb_secondDataPath/s_READADDR1
add wave -noupdate -radix unsigned -label ReadRegister2 tb_secondDataPath/s_READADDR2
add wave -noupdate -radix unsigned -label WriteRegister tb_secondDataPath/s_WRITEADDR

add wave -noupdate -divider "{Immediate in decimal}"
add wave -noupdate -label i_Immediate -radix decimal tb_secondDataPath/s_Immediate

add wave -noupdate -divider "{Register Contents}"
add wave -noupdate -label Registers -radix decimal -expand tb_secondDataPath/DUT0/mainReg/registerVector

run 2500
