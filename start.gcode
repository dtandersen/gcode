; BEGIN start.gcode
; 0 150 ---- 350 400

;M117 Priming nozzle          ; Indicate nozzle clean in progress on LCD
M107                         ; Turn layer fan off
G21	                         ; Set to metric
G90                          ; Force coordinates to be absolute relative to the origin
M211 S0                      ; Disable software endstops
M900 K1                      ; Set linear advance K-factor

; Bed level
G28 X Y                      ; Home X Y
M117 Clean extruder!
G1 X200 Y200 Z100 F3000      ; Clean me
G4 S5                        ; Wait
G28 Z                        ; Home Z
G29                          ; Auto bed level
;G1 X200 Y200 F3000           ; Center
;G0 Z0                        ; Go to Z = 0
;G92 Z.1                      ; Current Z is actually 0.1mm above the bed
M290 Z-0.1
;G1 Z50 F3000                 ; Clean me
;G4 S30                       ; Wait for heaters to recover

; Puddle
;M104 S220
;M109 S220
G1 X10 Y10 Z0.15 F12000         ; Move to corner
;G0 Z0.2                      ; Lower nozzle
G92 E0                       ; Zero extruder
G1 E25 F200                  ; Extrude a puddle
;G92 E0                       ; Zero extruder
;G1 E-2 F500                  ; Retract filiment by 2mm
G1 Z15 F12000                ; Rise to safe Z height
G4 S5                        ; Wait for filament to harden
G1 X290 Y10 Z2 F12000        ; Stretch ooze
G1 X20 Y0 Z5 F12000          ; Return to corner; raise to avoid clips
G1 X0 Y0 Z0.5 F12000         ; Go behind ooze pile
G1 X0 Y20 F12000             ; Go in front of ooze pile

; Prime
;G0 Z10 F9000                 ; Rise to safe Z height
;G0 X150 Y10 Z10 F9000        ; Move to start of line
;G0 Z0.2 F500                 ; Lower nozzle
;G92 E0                       ; Zero extruder
;G1 X350 E100 F2000           ; Extrude filament in line along X-axis
;G92 E0                       ; Zero extruder
;G1 E-2 F500                  ; Retract filiment by 2mm
;G1 Z10 F500                  ; Rise to safe Z height
;G4 S10                       ;
;G1 X5 Y5 F9000               ; Move back to front of bed at safe Z height to shear strings
;G1 Z.2 F1000
;G1 X5 Y5 F9000               ; Move back to front of bed at safe Z height to shear strings
;G1 X5 Y15 F9000               ; Move back to front of bed at safe Z height to shear strings
;G1 Z10 F1000

G92 E0                       ; Zero extruder
M82                          ; Absolute extrusion mode
M420 Z1                      ; Fade ABL after 1mm

M200 D1.75
M209 S0

; END start.gcode
