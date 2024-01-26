/* SCREEN
The origin (0,0) is the top left of the screen. The screen is viewed from the front.
Top is where the display connectore is located.
Up and right are the positive directions. A, B, C and D are the screw holes.

 (-2.0, -4.6)                     (214.6, -4.8)
          (A)○╔═════════════════╗○(B)
              ║    ↔ 212mm ↔    ║
              ║                 ║
              ║    ↕ 168mm ↕    ║
          (D)○╚═════════════════╝○(C)
(5.0, -169.6)                     (214.0, -162.5)
*/
width_screen = 212.0;
height_screen = 168.0;
holeDia_screen = 3.0;
offsetsA_screen = [ -2.0, -4.6 ];
offsetsB_screen = [ 214.6, -4.8 ];
offsetsC_screen = [ 214.0, -162.5 ];
offsetsD_screen = [ 5.0, -169.6 ];

/* MAINBOARD (DISPLAY DRIVER AND CONNECTOR BOARD)
The origin (0,0) is the top left of the PCB. The PCB is viewed from the populated side.
Top is the side opposite of the input connectors.
Up and right are the positive directions. A, B, C and D are the screw holes.

(2.3, -1.8)    (88.2, -1.8)
   ╔═════════════════╗
   ║○A  ↔ 89.7mm ↔ B○║
   ║                 ║
   ║○D  ↕ 47.6mm ↕ C○║
   ╚═════════════════╝
(2.3, -39.2)   (88.2, -45.8)
*/
width_Mainboard = 89.7;
height_Mainboard = 47.6;
holeDia_Mainboard = 3.3;
offsetsA_Mainboard = [ 2.3, -1.8 ];
offsetsB_Mainboard = [ 88.2, -1.8 ];
offsetsC_Mainboard = [ 88.2, -45.8 ];
offsetsD_Mainboard = [ 2.3, -39.2 ];

/* BACKLIGHT DRIVER BOARD
The origin (0,0) is the top left of the PCB. The PCB is viewed from the populated side.
Top is the with the shorter flat flex connector (out to display).
Up and right are the positive directions. B and D are the screw holes.

                (20.8, -2.2)
    ╔═════════════════╗
    ║    ↔ 32.0mm ↔ B○║
    ║                 ║
    ║○D  ↕ 20.3mm ↕   ║
    ╚═════════════════╝
(2.0, -16.9)
*/
width_LEDPCB = 32.0;
height_LEDPCB = 20.3;
screwHoleDia_LEDPCB = 2.0;
offsetsB_LEDPCB = [ 20.8, -2.2 ];
offsetsD_LEDPCB = [ 2.0, -16.9 ];
