transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/tim/Documents/Quartus/cube {C:/Users/tim/Documents/Quartus/cube/matrixMult.sv}

vlog -sv -work work +incdir+C:/Users/tim/Documents/Quartus/cube {C:/Users/tim/Documents/Quartus/cube/testMatrixMult.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testMatrixMult

add wave *
view structure
view signals
run -all
