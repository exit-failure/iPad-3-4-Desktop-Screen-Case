include <../lib/measurements.scad>

$fn = 128;

// TODO: SCREEN CASE FRONT incl. BEZEL
module screen_front()
{
    color("red") cube(1);
}

// TODO: SCREEN CASE BACK
module screen_back()
{
    color("green") cube(1);
}

// TODO: MAINBORAD CASE FRONT
module mainboard_front()
{
    color("blue") cube(1);
}

// TODO: MAINBORAD CASE BACK
module mainboard_back()
{
    color("yellow") cube(1);
}

// TODO: LED BOARD FRONT
module led_board_front()
{
    color("violet") cube(1);
}

// TODO: LED BOARD BACK
module led_board_back()
{
    color("black") cube(1);
}

// generate the requested model (for usage with makefile)
if (model == "screen_front.stl")
    screen_front();
if (model == "screen_back.stl")
    screen_back();
if (model == "mainboard_front.stl")
    mainboard_front();
if (model == "mainboard_back.stl")
    mainboard_back();
if (model == "led_board_front.stl")
    led_board_front();
if (model == "led_board_back.stl")
    led_board_back();
