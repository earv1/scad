from solid import *
from solid.utils import *  # Not required, but the utils module is useful

handle_width=33.5
attachment_width=10
attachment_height=15
rope_holder_wall_width=6
rope_holder_width = 30
rope_width=15

base_height=10

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
