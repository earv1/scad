#from .lib.grinder_base import GrinderBase

from solid import *
from solid.utils import *  # Not required, but the utils module is useful





#connector = DellConnector(x_holders=4, y_holders=2)

#scad = connector.rotate_to_print(connector.multiple_dell_holder())
#scad = connector.multiple_dell_holder()



#top = GrinderBase.custom_diameter(90, 17).platform()
#scad_render_to_file(top, "bed-base-legs_base.scad")

output_dir = "output/"

connector = linear_extrude(height=30)(square(47, center=True)-square(40, center=True))
scad_render_to_file(connector, output_dir + "coffee-connector.scad")
