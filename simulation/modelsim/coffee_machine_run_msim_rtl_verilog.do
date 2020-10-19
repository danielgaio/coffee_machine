transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/daniel/Documents/GitHub/coffee_machine_exercise_3 {/home/daniel/Documents/GitHub/coffee_machine_exercise_3/coffee_machine.sv}

