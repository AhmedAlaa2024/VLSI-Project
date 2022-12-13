vlog subMinus.v
vsim  subMinus


add wave -position end  subMinus/inputA
add wave -position end  subMinus/inputB
add wave -position end  subMinus/magnitude
add wave -position end  subMinus/sign

force subMinus/inputA 00001001
force subMinus/inputB 00000011

run

force subMinus/inputA 00000111
force subMinus/inputB 00000111

run

force /subMinus/inputA 00000111
force /subMinus/inputB 00001001

run