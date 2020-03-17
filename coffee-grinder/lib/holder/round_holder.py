from solid import *
from solid.utils import *  # Not required, but the utils module is useful


class RoundHolder:

    base_height = 4
    divider_height_start = 6 + base_height
    divider_width = 3

    image_width = 32

    def solid_holder_shape(self):
        return rotate(a=180, v = UP_VEC)(
            rotate_extrude(angle=360, convexity=10, segments=100)(
                resize([45, 0, 0], auto=True)(
                    import_("coffee-grinder/round_holder_width_45_half.svg", convexity=3))))

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

    def completeHolder(self):
        return self.hollow_holder_shape() - hole() (self.dividers())
