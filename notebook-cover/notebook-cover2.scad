a5Length=210;
a5Width=148;

spineHeight=5;

linear_extrude(height = a5Length, center = true) {
    circle(spineHeight, $fn=200);
}
