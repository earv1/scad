// Generated by SolidPython 0.4.8 on 2020-05-19 10:30:37


union() {
	translate(v = [0, 0, -9.7000000000]) {
		linear_extrude(height = 10.3000000000) {
			difference() {
				circle($fn = 100, d = 73.5000000000);
				circle($fn = 10, d = 6);
			}
		}
	}
	linear_extrude(height = 15) {
		difference() {
			circle($fn = 100, d = 43.7000000000);
			circle(d = 33.5000000000);
		}
	}
	translate(v = [0, 0, 7.0000000000]) {
		rotate_extrude($fn = 100, angle = 210, convexity = 80) {
			translate(v = [28.5000000000, 0, 0]) {
				rotate(a = 22.5000000000, v = [0, 0, 1]) {
					translate(v = [0, 0, 7.5000000000]) {
						difference() {
							circle($fn = 8, d = 21);
							circle($fn = 8, d = 15);
						}
					}
				}
			}
		}
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from solid import *
from solid.utils import *  # Not required, but the utils module is useful

handle_width=33.5
attachment_width=10
attachment_height=15
rope_holder_wall_width=6
rope_holder_width = 30
rope_width=15

base_height=10

import_scad('/path/to/scadfile.scad')

rope_holder=up(base_height - rope_holder_wall_width/2)(rotate_extrude(angle=210, convexity=80, segments = 100)(
    (right)((handle_width -5))(
        rotate(22.5, UP_VEC)(
       up(rope_width/2)(
           circle(d=(rope_width + rope_holder_wall_width), segments=8)
           - circle(d=(rope_width), segments=8))

           )
        # polygon([[0, -base_height], [0, attachment_height], [rope_holder_width, -base_height]]) - 
        # polygon([
        #     [0, rope_holder_wall_width -7], 
        #     [0, attachment_height - rope_holder_wall_width -2], 
        #     [rope_holder_width - rope_holder_wall_width-10, rope_holder_wall_width - 7]]) 
        # 
        )))

dell_attachment=linear_extrude(attachment_height)(
    circle(d=(handle_width + attachment_width + 0.2), segments=100) 
    - circle(d=handle_width))

base = down(base_height-0.3)(linear_extrude(base_height + 0.3)(
    circle(d=(attachment_width+handle_width + 
    rope_holder_width ), segments=100)- circle(d=6, segments = 10)))


rope_holder = base + dell_attachment + rope_holder
scad_render_to_file(rope_holder, "rope-pullup-handle.scad")
 
 
************************************************/