mem load -infile dmem.hex -format hex /tb_dmem/DUT0/ram

add wave -noupdate -divider {Clock}
add wave -noupdate -label CLK tb_dmem/s_CLK

add wave -noupdate -divider "{Single Bit Inputs}"
add wave -noupdate -label WE tb_dmem/s_WE

add wave -noupdate -divider "{Multi-Bit Inputs in Decimal}"
add wave -noupdate -label ADDR -radix decimal tb_dmem/s_ADDR
add wave -noupdate -label DATA -radix decimal tb_dmem/s_DATA

add wave -noupdate -divider "{Multi-Bit Outputs in Decimal}"
add wave -noupdate -label OUT -radix decimal tb_dmem/s_OUT

add wave -noupdate -divider "{RAM Address values in decimal}"
add wave -noupdate -label "RAM 0" -radix decimal tb_dmem/DUT0/ram(0)
add wave -noupdate -label "RAM 1" -radix decimal tb_dmem/DUT0/ram(1)
add wave -noupdate -label "RAM 2" -radix decimal tb_dmem/DUT0/ram(2)
add wave -noupdate -label "RAM 3" -radix decimal tb_dmem/DUT0/ram(3)
add wave -noupdate -label "RAM 4" -radix decimal tb_dmem/DUT0/ram(4)
add wave -noupdate -label "RAM 5" -radix decimal tb_dmem/DUT0/ram(5)
add wave -noupdate -label "RAM 6" -radix decimal tb_dmem/DUT0/ram(6)
add wave -noupdate -label "RAM 7" -radix decimal tb_dmem/DUT0/ram(7)
add wave -noupdate -label "RAM 8" -radix decimal tb_dmem/DUT0/ram(8)
add wave -noupdate -label "RAM 9" -radix decimal tb_dmem/DUT0/ram(9)

add wave -noupdate -label "RAM 100" -radix decimal tb_dmem/DUT0/ram(100)
add wave -noupdate -label "RAM 101" -radix decimal tb_dmem/DUT0/ram(101)
add wave -noupdate -label "RAM 102" -radix decimal tb_dmem/DUT0/ram(102)
add wave -noupdate -label "RAM 103" -radix decimal tb_dmem/DUT0/ram(103)
add wave -noupdate -label "RAM 104" -radix decimal tb_dmem/DUT0/ram(104)
add wave -noupdate -label "RAM 105" -radix decimal tb_dmem/DUT0/ram(105)
add wave -noupdate -label "RAM 106" -radix decimal tb_dmem/DUT0/ram(106)
add wave -noupdate -label "RAM 107" -radix decimal tb_dmem/DUT0/ram(107)
add wave -noupdate -label "RAM 108" -radix decimal tb_dmem/DUT0/ram(108)
add wave -noupdate -label "RAM 109" -radix decimal tb_dmem/DUT0/ram(109)


run 2000