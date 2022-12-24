vsim registered_WTM_tb

add wave -radix decimal sim:/registered_WTM_tb/A
add wave -radix decimal sim:/registered_WTM_tb/B
add wave -radix decimal sim:/registered_WTM_tb/Result

add wave -radix bin sim:/registered_WTM_tb/clk
add wave -radix bin sim:/registered_WTM_tb/reset

add wave -radix decimal sim:/registered_WTM_tb/counter

set num_test_cases		18

for {set i 0} {$i < ${num_test_cases}} {incr i} {
	run
}