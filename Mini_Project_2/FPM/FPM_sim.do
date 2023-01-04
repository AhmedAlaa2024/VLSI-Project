vlog HA.v FA.v WTM8.v adder64.v FPM.v registered_FPM.v
vsim  registered_FPM

add wave -radix hex registered_FPM/*
add wave -radix bin registered_FPM/clk
force registered_FPM/reset 0 
force -freeze sim:/registered_FPM/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/registered_FPM/en 1 0
puts "========================== Case 1 =========================="
# A = 3.125
force registered_FPM/A				32'h40480000
# B = 3.125
force registered_FPM/B				32'h40480000

run 300 ps

# Result = 9.765625
puts "411c4000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 2 =========================="
# A = 2.5
force registered_FPM/A				32'h40200000
# B = 5.125
force registered_FPM/B				32'h40a40000

run 300 ps

# Result = 12.8125
puts "414d0000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 3 =========================="
# A = 0.0625
force registered_FPM/A				32'h3d800000
# B = 0.125
force registered_FPM/B				32'h3e000000

run 300 ps

# Result = 0.0078125
puts "3c000000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 4 =========================="
# A = 5.25
force registered_FPM/A				32'h40a80000
# B = -3.0625
force registered_FPM/B				32'hc0440000

run 300 ps

# Result = -16.078125
puts "c180a000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 5 =========================="
# A = -5.25
force registered_FPM/A				32'hc0a80000
# B = -3.125
force registered_FPM/B				32'hc0480000

run 300 ps

# Result = 16.40625
puts "41834000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 6 =========================="
# A = 0.0
force registered_FPM/A				32'h00000000
# B = 3.125
force registered_FPM/B				32'h40480000

run 300 ps

# Result = 0
puts "00000000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 7 =========================="
# A = 1.0
force registered_FPM/A				32'h3f800000
# B = 3.125
force registered_FPM/B				32'h40480000

run 300 ps

# Result = 3.125
puts "40480000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 8 =========================="
# A = 0.0
force registered_FPM/A				32'h00000000
# B = -3.125
force registered_FPM/B				32'hc0480000

run 300 ps

# Result = 0
puts "00000000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 9 =========================="
# A = 1.0
force registered_FPM/A				32'h3f800000
# B = -3.125
force registered_FPM/B				32'hc0480000

run 300 ps

# Result = -3.125
puts "c0480000"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 10 =========================="
# A = 0.0
force registered_FPM/A				32'h00000000
# B = 0.0
force registered_FPM/B				32'h00000000

run 300 ps

# Result = 0.0
puts "00000000"
puts [examine -radix hex registered_FPM/Result]