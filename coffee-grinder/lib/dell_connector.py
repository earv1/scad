import string

from solid import *
from solid.utils import *  # Not required, but the utils module is useful


class DellConnector:
    dell_stick_hole_length = 20
    dell_stick_hole_diameter = 16.10
    dell_stick_holder_thickness = 6

    x_holders = 4
    y_holders = 2

    @classmethod
    def __init__(self, dell_stick_hole_width=20, dell_stick_hole_diameter=16.10, x_holders=4, y_holders=4):
        self.dell_stick_hole_length = dell_stick_hole_width
        self.dell_stick_hole_diameter = dell_stick_hole_diameter
        self.x_holders = x_holders
        self.y_holders = y_holders

    def __dell_holder_hole(self):
        return linear_extrude(height=self.dell_stick_hole_length + 4)(circle(d=self.dell_stick_hole_diameter))

    def __dell_holder_exterior(self):
        return linear_extrude(height=self.dell_stick_hole_length)(
            circle(d=self.dell_stick_hole_diameter + self.dell_stick_holder_thickness))

    def single_dell_holder(self):
        return self.__dell_holder_exterior() + hole()(self.__dell_holder_hole())

    def multiple_dell_holder(self):
        y_angle = 180
        x_angle = 90

        dell_holders = []

        for x in range(0, self.x_holders, 1):
            dell_holders += rotate(a=90, v=FORWARD_VEC)(
                rotate(a=x * x_angle, v=RIGHT_VEC)(
                    self.__dell_holder_exterior() + hole()(self.__dell_holder_hole())))

        for y in range(0, self.y_holders, 1):
            dell_holders += rotate(a=y * y_angle, v=FORWARD_VEC)(
                self.__dell_holder_exterior() + hole()(self.__dell_holder_hole()))

        return dell_holders

    def rotate_to_print(self, dell_holders):
        return rotate(a=45, v=FORWARD_VEC)(
            rotate(a=45, v=RIGHT_VEC)(
                dell_holders))




