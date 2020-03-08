from .lib.grinder_base import GrinderBase

from solid import *
from solid.utils import *  # Not required, but the utils module is useful

base = GrinderBase()


d = difference()(
    cube(10),  # Note the comma between each element!
    sphere(15)
)

scad = base.platform()


scad_render_to_file(scad, "coffee-grinder3.scad")