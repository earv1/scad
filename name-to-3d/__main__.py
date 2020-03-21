from solid import *
from solid.utils import *  # Not required, but the utils module is useful

font = "Liberation Sans:style=Bold"
line1 = text("# 19", font=font, size=5)
line2 = back(3.5)(text("Forever", font = font,size=2.6))
all_lines = linear_extrude(3)(line1 + line2)

rectangle_for_name=left(2.5)(back(4.2)(square([19, 10])))

complete_name_with_inset = rectangle_for_name - hole()(line1 + line2)

key_chain_holder = right(7)(forward(6)(circle(2,segments=100) - circle(1.1, segments=100)))

complete_key_chain = linear_extrude(2.2)(key_chain_holder + complete_name_with_inset)

scad_render_to_file(complete_key_chain, "what-is-in-a-name.scad")
