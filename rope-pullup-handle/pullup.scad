include <../lib/directionality/directionality.scad>

handle_height = 100;
handle_width=33.5;
attachment_width=10;
attachment_height=15;
rope_holder_wall_width=6;
rope_holder_width = 30;
rope_width=15;

base_height=10;

module rope_holder(){
            up(base_height - rope_holder_wall_width/2){
            circle(20);
             rotate_extrude(angle=210, convexity=80)
                 right(handle_width -5)
                     rotate(22.5, UP_VEC)
                     up(rope_width/2)
                        difference(){
                         circle(d=(rope_width + rope_holder_wall_width), segments=8);
                         circle(d=(rope_width), segments=8);

                        }


            };
}

module dell_attachment(){
    linear_extrude(attachment_height)
    difference(){
        circle(d=(handle_width + attachment_width + 0.2), segments=100);
        circle(d=handle_width);
    };
} 

module base() {
  down(base_height-0.3){
        linear_extrude(base_height + 0.3)
        difference(){
            circle(d=(attachment_width+handle_width + 
            rope_holder_width ), segments=100); 
            circle(d=6, segments = 10);
        }
  }
}

module handle_attachment(){
    color("orange")
    union(){
        rope_holder();
        base();
        dell_attachment();
    }
}

module handle(){
    color("grey")
    up(base_height){
        linear_extrude(handle_height + attachment_height*2){
            circle(d = handle_width);
        }
    }
}

handle();
handle_attachment(); 

