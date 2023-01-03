vlog subMinus.v ControlledShiftRegister.v adderPlus.v NormalizerAndRounder.v FPA.v
vsim  FPA

add wave -color Green     -radix bin FPA/A
add wave -color Yellow    -radix bin FPA/B
add wave -color cyan      -radix bin FPA/Sum

add wave -color Magenta     -radix bin FPA/A_mantissa
add wave -color Magenta    -radix bin FPA/B_mantissa

add wave -color Magenta      -radix bin FPA/borrow
add wave -color Magenta   -radix bin /FPA/ShiftRegister/data_in
add wave -color Magenta   -radix bin /FPA/ShiftRegister/data_out
add wave -color Magenta   -radix unsigned /FPA/ShiftRegister/steps

add wave -color Magenta   -radix bin /FPA/adder/inputA
add wave -color Magenta   -radix bin /FPA/adder/inputB
add wave -color Magenta   -radix bin /FPA/adder/Sum

add wave -color Magenta   -radix bin FPA/Final_Sum

# add wave -color Magenta   -radix bin /FPA/adder/A
# add wave -color Magenta   -radix bin /FPA/adder/B
# add wave -color Magenta   -radix bin /FPA/adder/S
# add wave -color Magenta   -radix bin /FPA/adder/cout
# add wave -color Magenta   -radix bin /FPA/adder/OF

#add wave -color Magenta   -radix bin /FPA/normalizerAndRounder/carry
#add wave -color Magenta   -radix bin /FPA/normalizerAndRounder/oldExponent
#add wave -color Magenta   -radix bin /FPA/normalizerAndRounder/oldMantissa
#add wave -color Magenta   -radix bin /FPA/normalizerAndRounder/newExponent
#add wave -color Magenta   -radix bin /FPA/normalizerAndRounder/newMantissa
puts "========================== Case 1 =========================="
# A = 3.125
force FPA/A				32'h40480000
# B = 3.125
force FPA/B				32'h40480000

run 100 ps

# C = 6.25
puts "40c80000"
puts [examine -radix hex FPA/Sum]

puts "========================== Case 2 =========================="
# A = 2.5
force FPA/A				32'h40200000
# B = 5.125
force FPA/B				32'h40a40000

run 100 ps

# C = 7.625
puts "40f40000"
puts [examine -radix hex FPA/Sum]

puts "========================== Case 3 =========================="
# A = 0.0625
force FPA/A				32'h3d800000
# B = 0.125
force FPA/B				32'h3e000000

run 100 ps

# C = 0.1875
puts "3e400000"
puts [examine -radix hex FPA/Sum]

puts "========================== Case 4 =========================="
# A = 5.25
force FPA/A				32'h40a80000
# B = -3.0625
force FPA/B				32'hc0440000

run 100 ps

# C = 2.1875
puts "400c0000"
puts [examine -radix hex FPA/Sum]

puts "========================== Case 5 =========================="
# A = -5.25
force FPA/A				32'hc0a80000
# B = -3.125
force FPA/B				32'hc0480000

run 100 ps

# C = -8.375
puts "c1060000"
puts [examine -radix hex FPA/Sum]