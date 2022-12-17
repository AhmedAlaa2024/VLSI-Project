vlog ControlledShiftRegister.v
vsim  ControlledShiftRegister

add wave -position end  ControlledShiftRegister/data_in
add wave -position end  ControlledShiftRegister/enable
add wave -position end  ControlledShiftRegister/direction
add wave -position end  ControlledShiftRegister/steps
add wave -position end  ControlledShiftRegister/reset
add wave -position end  ControlledShiftRegister/data_out

puts "========================== Case 1 =========================="
force ControlledShiftRegister/enable	1
force ControlledShiftRegister/direction 0
force ControlledShiftRegister/reset		1

force ControlledShiftRegister/steps 	001
force ControlledShiftRegister/data_in 	11110101

run 1 ps

puts [examine ControlledShiftRegister/data_out]

puts "========================== Case 2 =========================="
force ControlledShiftRegister/enable	1
force ControlledShiftRegister/direction 0
force ControlledShiftRegister/reset		1

force ControlledShiftRegister/steps 	001
force ControlledShiftRegister/data_in 	00110011

run 1 ps

puts [examine ControlledShiftRegister/data_out]