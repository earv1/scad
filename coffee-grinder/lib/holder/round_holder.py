from solid import *
from solid.utils import *  # Not required, but the utils module is useful


class RoundHolder:

    base_dimensions = 80
    base_hole_width = 47

    base_height = 4
    divider_height_start = 6 + base_height - 0.1
    divider_width = 3

    image_width = 32

    def solid_holder_shape(self):
        return rotate(a=180, v = UP_VEC)(
            rotate_extrude(angle=360, segments=20)(
                resize([45, 0, 1], auto=True)(
                    import_("coffee-grinder/round_holder_width_45_half.svg"))))

    def hollow_holder_shape(self):
        return (scale(1.1)(self.solid_holder_shape())) + translate((0, 0, 10))(hole()(
            self.solid_holder_shape()))

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
            square(self.base_dimensions, center=True) - hole()(
                square(self.base_hole_width, center=True)
            ))

    def completeHolder(self):
        return self.hollow_holder_shape()# + self.base() - hole() (self.dividers())
        #return self.base() - hole() (self.dividers())
