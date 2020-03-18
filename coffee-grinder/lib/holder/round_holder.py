from solid import *
from solid.utils import *  # Not required, but the utils module is useful


class RoundHolder:

    base_dimensions = 80
    base_hole_width = 47

    base_height = 10
    divider_height_start = 6 + base_height
    divider_width = 3

    image_width = 32

    def holder_inside(self):
        return up(50)(sphere(50))

    def holder_exterior(self):
        return scale(1.05)(
            up(50)(sphere(50) - up(50)(cube(100, center=True))))

    def complete_holder(self):
        return self.holder_exterior() + hole()(self.holder_inside())

    def dividers(self):
        square_size = 500
        segment_count = 5

        segments = []
        for x in range(0, 360, int(360 / segment_count)):
            segments += rotate(a=x, v=UP_VEC) (up(self.divider_height_start)(
                left(square_size/2)(
                    rotate(a=90, v=RIGHT_VEC) (
                        down(self.divider_width/2)(
                            linear_extrude(self.divider_width)(
                                square(square_size)))))))
        return segments


    def base(self):
        return linear_extrude(self.base_height)(
            square(self.base_dimensions, center=True)) - hole()(
            linear_extrude(self.base_height/2)(
                square(self.base_hole_width, center=True)
            ))

    def completeHolder(self):
        return self.complete_holder() + self.base() - hole() (self.dividers())
