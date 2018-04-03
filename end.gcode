; BEGIN end.gcode

G91 ; relative
G1 F1800 E-2
;G1 F3000 Z10
G90 ; absolute
G1 X200 Y350 F3000; go to back
M106 S0 ; turn off cooling fan
M104 S0 ; turn off extruder
M140 S0 ; turn off bed
M84 X Y E; disable motors

; END end.gcode
