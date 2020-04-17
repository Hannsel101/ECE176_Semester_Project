onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {FUNCTIONS TEST BEGIN}
add wave -noupdate -expand -group {MODULO TEST WAVES} -label {Modulo Output} -radix unsigned /TESTBENCH/modOutput
add wave -noupdate -expand -group {MODULO TEST WAVES} -label {Modulo Input} -radix unsigned /TESTBENCH/modTester
add wave -noupdate -divider {FUNCTIONS TEST END}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {CACHE TEST BEGIN}
add wave -noupdate -divider {CACHE TEST END}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {CONTROL TEST BEGIN}
add wave -noupdate -group CONTROL -divider {CONTROL TEST END}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {REGISTER TEST BEGIN}
add wave -noupdate -divider {REGISTER TEST END}
add wave -noupdate -divider <NULL>
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 199
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {7 ps}
