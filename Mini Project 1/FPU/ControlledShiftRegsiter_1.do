vlog ControlledShiftRegister.v
vsim  ControlledShiftRegister


add wave -position end  ControlledShiftRegister/in
add wave -position end  ControlledShiftRegister/clk
add wave -position end  ControlledShiftRegister/enable
add wave -position end  ControlledShiftRegister/direction
add wave -position end  ControlledShiftRegister/reset
add wave -position end  ControlledShiftRegister/data

puts "================= Shifting Left ================="
force ControlledShiftRegister/enable	1
force ControlledShiftRegister/direction 0
force ControlledShiftRegister/reset		1

for {set i 0} {$i < 8} {incr i} {	
	force ControlledShiftRegister/in 	1
	
	# Clock Cycle
	force ControlledShiftRegister/clk	0
	run
	force ControlledShiftRegister/clk	1
	run
	force ControlledShiftRegister/clk	0
	run
	
	puts [examine ControlledShiftRegister/data]
}

puts "================= Shifting Right ================="
force ControlledShiftRegister/enable	1
force ControlledShiftRegister/direction 1
force ControlledShiftRegister/reset		1

for {set i 0} {$i < 4} {incr i} {
	force ControlledShiftRegister/in 	0
	
	# Clock Cycle
	force ControlledShiftRegister/clk	0
	run
	force ControlledShiftRegister/clk	1
	run
	force ControlledShiftRegister/clk	0
	run
	
	puts [examine ControlledShiftRegister/data]
}

force ControlledShiftRegister/enable	0

for {set i 0} {$i < 4} {incr i} {
	force ControlledShiftRegister/in 	0
	
	# Clock Cycle
	force ControlledShiftRegister/clk	0
	run
	force ControlledShiftRegister/clk	1
	run
	force ControlledShiftRegister/clk	0
	run
	
	puts [examine ControlledShiftRegister/data]
}