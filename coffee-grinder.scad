use <MCAD/regular_shapes.scad>

dell_stick_hole_length=50;
dell_stick_hole_diameter=16.10;
dell_stick_thickness=6;
base_dimensions=145;

module hole() {
     linear_extrude(height=dell_stick_hole_length+4) {
          circle(d=dell_stick_hole_diameter);
     }
}

module dell_holder_exterior() {
     linear_extrude(height=dell_stick_hole_length) {
          circle(d=dell_stick_hole_diameter+dell_stick_thickness);
     }
}


module dell_holder() {
     difference() {
          dell_holder_exterior();
          hole();
     }
}


module platform_base(){
     linear_extrude(height=30)
     square(base_dimensions, center=true);
}



dell_holder_offset=(base_dimensions - dell_stick_thickness - dell_stick_hole_diameter) /2;
module platform_exterior() {


     for (x =[-1:2:1]){
          for (y =[-1:2:1]){
               translate([dell_holder_offset *x,dell_holder_offset*y,5]) {
                    dell_holder_exterior();
               }
          }
     }

     platform_base();
}

module platform_holes(){
     for (x =[-1:2:1]){
          for (y =[-1:2:1]){
               translate([dell_holder_offset * x,dell_holder_offset * y, 5]) {
                    hole();
               }
          }
     }
}

difference (){
     platform_exterior();
     platform_holes();
}





