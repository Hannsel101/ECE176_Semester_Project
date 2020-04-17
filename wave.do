onerror {resume}
quietly set dataset_list [list sim vsim1 vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly virtual function -install vsim1:/TESTBENCH -env vsim1:/TESTBENCH { &{vsim1:/TESTBENCH/modTester, vsim1:/TESTBENCH/modOutput }} hmmm
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {FUNCTIONS TEST BEGIN}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {FUNCTIONS TEST END}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {CACHE TEST BEGIN}
add wave -noupdate -divider {CACHE TEST END}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {CONTROL TEST BEGIN}
add wave -noupdate -group CONTROL -divider {CONTROL TEST END}
add wave -noupdate -group CONTROL -divider {CONTROL TEST END}
add wave -noupdate -group CONTROL -divider {CONTROL TEST END}
add wave -noupdate -divider <NULL>
add wave -noupdate -divider {REGISTER TEST BEGIN}
add wave -noupdate -divider {REGISTER TEST END}
add wave -noupdate sim:/TESTBENCH/modTester
add wave -noupdate sim:/TESTBENCH/modOutput
add wave -noupdate sim:/TESTBENCH/signExtendIn
add wave -noupdate sim:/TESTBENCH/signExtendOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1 ps} 0}
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
WaveRestoreZoom {2 ps} {9 ps}
