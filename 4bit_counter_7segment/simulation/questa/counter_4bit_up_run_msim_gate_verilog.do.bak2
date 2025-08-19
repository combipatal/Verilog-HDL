transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {counter_4bit_up.vo}

vlog -vlog01compat -work work +incdir+C:/altera/project/pro1 {C:/altera/project/pro1/counter_4bit_up_tb.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  counter_4bit_up_tb

add wave *
view structure
view signals
run 200 ns
