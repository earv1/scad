import string

from solid import *
from solid.utils import *  # Not required, but the utils module is useful


class GrinderBase:
    dell_stick_hole_length = 50
    dell_stick_hole_diameter = 16.10
    dell_stick_thickness = 6
    base_dimensions = 145

    def ___init___(self, dell_stick_hole_length, dell_stick_hole_diameter, dell_stick_thickness, base_dimensions):
        self.dell_stick_hole_length = dell_stick_hole_length
        self.dell_stick_hole_diameter = dell_stick_hole_diameter
        self.dell_stick_thickness = dell_stick_thickness
        self.base_dimensions = base_dimensions

    def hole(self):
        return linear_extrude(height=self.dell_stick_hole_length + 4)(circle(d=self.dell_stick_hole_diameter))

    def dell_holder_exterior(self):
       return linear_extrude(height=self.dell_stick_hole_length)(circle(d=self.dell_stick_hole_diameter+self.dell_stick_thickness))

    def dell_holder(self):
        return difference() (
            self.dell_holder_exterior(),
            self.hole())


    def platform_base(self):
        return linear_extrude(height=30)(square(self.base_dimensions, center=True))


    def platform_holes(self):
        dell_holder_offset=(self.base_dimensions - self.dell_stick_thickness - self.dell_stick_hole_diameter) / 2

        holes = []
        for x in range(-1, 1+1, 2):
            for y in range(-1, 1+1, 2):
                holes += translate((dell_holder_offset * x, dell_holder_offset * y, 5))(self.hole())
        return holes


#
    def platform_exterior(self):
        platform = []

        dell_holder_offset=(self.base_dimensions - self.dell_stick_thickness - self.dell_stick_hole_diameter) / 2

        for x in range(-1, 1+1, 2):
            for y in range(-1, 1+1, 2):
                platform += translate((dell_holder_offset * x, dell_holder_offset * y, 5))(self.dell_holder_exterior())
        platform += self.platform_base()
        return platform

    def platform(self):
        return difference()(
            self.platform_exterior(),
            self.platform_holes())

