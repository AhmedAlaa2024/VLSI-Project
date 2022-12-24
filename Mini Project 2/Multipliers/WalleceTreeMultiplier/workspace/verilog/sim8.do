vlog HA.v FA.v WTM8.v
vsim WTM8

add wave sim:/WTM8/*

# A = 125
force A 01111101
# B = 38
force B 00100110

run
# Result = 4750 = 0001 0010 1000 1110

# A = -125
force A 10000011
# B = 38
force B 00100110

run
# Result = -4750 = 1110 1101 0111 0010

# A = 125
force A 01111101
# B = -38
force B 11011010

run
# Result = -4750 = 1110 1101 0111 0010

# A = -125
force A 10000011
# B = -38
force B 11011010

run
# Result = 4750 = 1110 1101 0111 0010