vlog HA.v FA.v WTM8.v adder64.v WTM32.v FPM.v
vsim  FPM

add wave -radix float32 FPM/*

puts "========================== Case 1 =========================="
# A = 3.125
force FPM/A				32'h40480000
# B = 3.125
force FPM/B				32'h40480000

run 100 ps

# Result = 9.765625
puts "411c4000"
puts [examine -radix hex FPM/Result]

puts "========================== Case 2 =========================="
# A = 2.5
force FPM/A				32'h40200000
# B = 5.125
force FPM/B				32'h40a40000

run 100 ps

# Result = 12.8125
puts "414d0000"
puts [examine -radix hex FPM/Result]

puts "========================== Case 3 =========================="
# A = 0.0625
force FPM/A				32'h3d800000
# B = 0.125
force FPM/B				32'h3e000000

run 100 ps

# Result = 0.0078125
puts "3c000000"
puts [examine -radix hex FPM/Result]

puts "========================== Case 4 =========================="
# A = 5.25
force FPM/A				32'h40a80000
# B = -3.0625
force FPM/B				32'hc0440000

run 100 ps

# Result = -16.078125
puts "c180a000"
puts [examine -radix hex FPM/Result]

puts "========================== Case 5 =========================="
# A = -5.25
force FPM/A				32'hc0a80000
# B = -3.125
force FPM/B				32'hc0480000

run 100 ps

# Result = 16.40625
puts "41834000"
puts [examine -radix hex FPM/Result]