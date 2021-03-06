// Generated by SolidPython 0.4.7 on 2020-04-10 19:30:12


linear_extrude(height = 30) {
	difference() {
		square(center = true, size = 47);
		square(center = true, size = 40);
	}
}
/***********************************************
*********      SolidPython code:      **********
************************************************
 
from .lib.grinder_base import GrinderBase
from .lib.dell_connector import DellConnector
from .lib.holder.round_holder import RoundHolder

from solid import *
from solid.utils import *  # Not required, but the utils module is useful





#connector = DellConnector(x_holders=4, y_holders=2)

#scad = connector.rotate_to_print(connector.multiple_dell_holder())
#scad = connector.multiple_dell_holder()



#top = GrinderBase.custom_diameter(90, 17).platform()
#scad_render_to_file(top, "coffee-grinder_base.scad")


base = GrinderBase().platform()
scad_render_to_file(base, "coffee-grinder_base.scad")


round_holder = RoundHolder().completeHolder()
scad_render_to_file(round_holder, "coffee-round-holder.scad")

connector = linear_extrude(height=30)(square(47, center=True)-square(40, center=True))
scad_render_to_file(connector, "coffee-connector.scad")
 
 
************************************************/
