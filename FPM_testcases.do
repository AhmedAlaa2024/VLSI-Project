vsim registered_FPM -t ps -sdfmax registered_FPM.sdf

add wave -radix hex registered_FPM/*
add wave -radix bin registered_FPM/clk

# ========================== Initialize ==========================

force registered_FPM/reset 0 
force -freeze sim:/registered_FPM/clk 1 0, 0 {50 ns} -r 100 ns
force -freeze registered_FPM/en 1 0

puts "========================== Case 1 =========================="
# A = 3.125
force registered_FPM/A				32'h49072340
# B = 3.125
force registered_FPM/B				32'h44520000

run 300 ns

# Result = 9.765625
puts "4DDDB5D5"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 2 =========================="
# A = 2.5
force registered_FPM/A				32'h4EA0C8E4
# B = 5.125
force registered_FPM/B				32'h4EA0C246

run 300 ns

# Result = 12.8125
puts "5DC9EF1C"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 3 =========================="
# A = 0.0625
force registered_FPM/A				32'h49072340
# B = 0.125
force registered_FPM/B				32'hC3818000

run 300 ns

# Result = 0.0078125
puts "CD08B8AA"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 4 =========================="
# A = 5.25
force registered_FPM/A				32'h4EA0C8E4
# B = -3.0625
force registered_FPM/B				32'hCE8EF06B

run 300 ns

# Result = -16.078125
puts "DDB38CBA"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 5 =========================="
# A = -5.25
force registered_FPM/A				32'hC3818000
# B = -3.125
force registered_FPM/B				32'h49072340

run 300 ns

# Result = 16.40625
puts "CD08B8AA"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 6 =========================="
# A = 0.0
force registered_FPM/A				32'hCE8EF06B
# B = 3.125
force registered_FPM/B				32'h4EA0C8E4

run 300 ns

# Result = 0
puts DDB38CBA"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 7 =========================="
# A = 1.0
force registered_FPM/A				32'hC3818000
# B = 3.125
force registered_FPM/B				32'hC3818000

run 300 ns

# Result = 3.125
puts "47830480"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 8 =========================="
# A = 0.0
force registered_FPM/A				32'hCE8EF06B
# B = -3.125
force registered_FPM/B				32'hCEEF06AA

run 300 ns

# Result = 0
puts "5E05762A"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 9 =========================="
# A = 1.0
force registered_FPM/A				32'h3F800000
# B = -3.125
force registered_FPM/B				32'h4EA0C8E4

run 300 ns

# Result = -3.125
puts "4EA0C8E4"
puts [examine -radix hex registered_FPM/Result]

puts "========================== Case 10 =========================="
# A = 0.0
force registered_FPM/A				32'hCE8EF06B
# B = 0.0
force registered_FPM/B				32'h3F800000

run 300 ns

# Result = 0.0
puts "CE8EF06B"
puts [examine -radix hex registered_FPM/Result]
puts "========================== Case 11 =========================="
# A = 0.0
force registered_FPM/A				32'h0
# B = 0.0
force registered_FPM/B				32'h4EA0C8E4

run 300 ns

# Result = 0.0
puts "0"
puts [examine -radix hex registered_FPM/Result]
puts "========================== Case 12 =========================="
# A = 0.0
force registered_FPM/A				32'hCE8EF06B
# B = 0.0
force registered_FPM/B				32'h0

run 300 ns

# Result = 0.0
puts "0"
puts [examine -radix hex registered_FPM/Result]
puts "========================== Case 13 =========================="
# A = 0.0
force registered_FPM/A				32'h3FFFFFF0
# B = 0.0
force registered_FPM/B				32'h41A00000

run 300 ns

# Result = 0.0
puts "1"
puts [examine -radix hex registered_FPM/Overflow]
puts "========================== Case 14 =========================="
# A = 0.0
force registered_FPM/A				32'hBFFFFFFF
# B = 0.0
force registered_FPM/B				32'h41A00000

run 300 ns

# Result = 0.0
puts "1"
puts [examine -radix hex registered_FPM/Overflow]
puts "========================== Case 15 =========================="
# A = 0.0
force registered_FPM/A				32'h35D00998
# B = 0.0
force registered_FPM/B				32'h800000

run 300 ns

# Result = 0.0
puts "0x0000000D"
puts [examine -radix hex registered_FPM/Result]