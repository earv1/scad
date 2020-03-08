use <MCAD/regular_shapes.scad>

use <threadlib/threadlib.scad>


thread("M16x1.25-int", turns=6);
/*
difference(){
    cylinder(h=screwdriverHeight, r=7.1/2, $fn=50);
    translate(v=[0,0,screwdriverHeight - screwbitHeight + 0.1]) {
        linear_extrude(height = screwbitHeight, center = false, convexity = 10, twist = 0) {
            hexagon(hexagonRadius);
        }
    }
}


gripHeight=18;

translate(v=[0,0, gripHeight]) {
    linear_extrude(height = gripHeight/2, center = false, convexity = 10, twist = 0, scale=-5) {
        hexagon(10);
    }
}

linear_extrude(height = gripHeight, center = false, convexity = 10, twist = 0) {
    hexagon(10);
}
*/

