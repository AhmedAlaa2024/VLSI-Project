vsim sequential_multiplier -t ps -sdfmax sequential_multiplier.sdf

add wave -radix hex sequential_multiplier/*
add wave -radix bin sequential_multiplier/clk

# ========================== Initialize ==========================

force sequential_multiplier/reset 0 
force -freeze sim:/sequential_multiplier/clk 1 0, 0 {50 ns} -r 100 ns
force -freeze sequential_multiplier/en 1 0
force -freeze sequential_multiplier/reset 0 0
puts "========================== Case 1 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = 32'd7
force sequential_multiplier/multiplicand			-32'd553524
# B = 32'd2
force sequential_multiplier/multiplier				32'840
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = -64'd14
puts "464960160"
puts [examine -radix decimal sequential_multiplier/product]

puts "========================== Case 2 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = 32'd7
force sequential_multiplier/multiplicand			-32'd1348760118
# B = 32'd2
force sequential_multiplier/multiplier				32'd1348543286
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = -64'd21
puts "1.81886E+18"
puts [examine -radix decimal sequential_multiplier/product]

puts "========================== Case 3 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = 32'd7
force sequential_multiplier/multiplicand			32'd553524
# B = 32'd2
force sequential_multiplier/multiplier				-32'd259
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "-143362716"
puts [examine -radix decimal sequential_multiplier/product]

puts "========================== Case 4 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = 32'd7
force sequential_multiplier/multiplicand			32'd1348760118
# B = 32'd2
force sequential_multiplier/multiplier				-32'd1199060305
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = -64'd200
puts "-1.61724E+18"
puts [examine -radix decimal sequential_multiplier/product]

puts "========================== Case 5 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd80
force sequential_multiplier/multiplicand			-32'd259
# B = 32'd0;
force sequential_multiplier/multiplier				32'd553524;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "-143362716"
puts [examine -radix decimal sequential_multiplier/product]


puts "========================== Case 6 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			-32'd1199060305;
# B = -32'd2;
force sequential_multiplier/multiplier				32'd1348760118;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd4
puts "-1.61724E+18"
puts [examine -radix decimal sequential_multiplier/product]


puts "========================== Case 7 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			32'd-259;
# B = -32'd2;
force sequential_multiplier/multiplier				32'd-259;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "67081"
puts [examine -radix decimal sequential_multiplier/product]


puts "========================== Case 8 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			-32'd1199060305;
# B = -32'd2;
force sequential_multiplier/multiplier				-32'd2005095693;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "2.40423E+18"
puts [examine -radix decimal sequential_multiplier/product]

puts "========================== Case 9 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			-32'd1;
# B = -32'd2;
force sequential_multiplier/multiplier				32'd1348760118;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "1348760118"
puts [examine -radix decimal sequential_multiplier/product]

puts "========================== Case 10 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			-32'd1199060305;
# B = -32'd2;
force sequential_multiplier/multiplier				32'd1;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "-1199060305"
puts [examine -radix decimal sequential_multiplier/product]
puts "========================== Case 11 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			32'd0;
# B = -32'd2;
force sequential_multiplier/multiplier				32'd1348760118;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "0"
puts [examine -radix decimal sequential_multiplier/product]
puts "========================== Case 12 =========================="
force -freeze sequential_multiplier/set_signal 1 0
run 500
# A = -32'd2;
force sequential_multiplier/multiplicand			-32'd1199060305;
# B = -32'd2;
force sequential_multiplier/multiplier				32'd0;
force -freeze sequential_multiplier/set_signal 0 0
run 10000 ns

# Result = 64'd0
puts "0"
puts [examine -radix decimal sequential_multiplier/product]