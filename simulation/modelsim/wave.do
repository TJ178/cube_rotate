onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testMatrixMult/a
add wave -noupdate /testMatrixMult/b
add wave -noupdate /testMatrixMult/out
add wave -noupdate /testMatrixMult/clk
add wave -noupdate /testMatrixMult/m/clk
add wave -noupdate /testMatrixMult/m/rst
add wave -noupdate /testMatrixMult/m/a
add wave -noupdate /testMatrixMult/m/b
add wave -noupdate /testMatrixMult/m/out
add wave -noupdate /testMatrixMult/m/a
add wave -noupdate /testMatrixMult/m/b
add wave -noupdate /testMatrixMult/m/buffA
add wave -noupdate /testMatrixMult/m/buffB
add wave -noupdate -childformat {{{/testMatrixMult/m/buffC[0]} -radix decimal} {{/testMatrixMult/m/buffC[1]} -radix decimal} {{/testMatrixMult/m/buffC[2]} -radix decimal}} -expand -subitemconfig {{/testMatrixMult/m/buffC[0]} {-radix decimal} {/testMatrixMult/m/buffC[1]} {-radix decimal} {/testMatrixMult/m/buffC[2]} {-radix decimal}} /testMatrixMult/m/buffC
add wave -noupdate -expand /testMatrixMult/m/buffC_d
add wave -noupdate /testMatrixMult/m/clk
add wave -noupdate /testMatrixMult/m/IN_BITS
add wave -noupdate /testMatrixMult/m/IN_FRAC_BITS
add wave -noupdate /testMatrixMult/m/out
add wave -noupdate /testMatrixMult/m/rst
add wave -noupdate /testMatrixMult/m/SIZE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 232
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {27 ps}
