vlog mux.v
vsim  mux


add wave -position end  mux/in[0]
add wave -position end  mux/in[1]
add wave -position end  mux/sel
add wave -position end  mux/enable
add wave -position end  mux/out

force mux/in[0]  00001001
force mux/in[1]  00001111
force mux/sel 	 0
force mux/enable 1

run

force mux/in[0]  00001001
force mux/in[1]  00001111
force mux/sel 	 1
force mux/enable 1

run

force mux/in[0]  00001001
force mux/in[1]  00001111
force mux/sel 	 0
force mux/enable 0

run

force mux/in[0]  00001001
force mux/in[1]  00001111
force mux/sel 	 1
force mux/enable 0

run