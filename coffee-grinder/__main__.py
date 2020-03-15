from .lib.grinder_base import GrinderBase
from .lib.dell_connector import DellConnector

from solid import *
from solid.utils import *  # Not required, but the utils module is useful

base = GrinderBase()

top = GrinderBase.custom_diameter(90, 17)

connector = DellConnector(x_holders=4, y_holders=2)

scad = connector.rotate_to_print(connector.multiple_dell_holder())
scad = connector.multiple_dell_holder()

scad_render_to_file(scad, "coffee-grinder3.scad")