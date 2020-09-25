include <../lib/Round-Anything/polyround.scad>
include <../lib/directionality/directionality.scad>


roof_connector_x_size = 2;
roof_connector_y_size = 20;
light_fitting_x_size = 20;
light_fitting_y_size = 10;
bottom_start_x = 5 + light_fitting_x_size;
radius = 0;


display_directions();


module 2dConnectorShape() {

    polygon(polyRound([
        
        //left side of roof connector
        [bottom_start_x,0,radius],[light_fitting_x_size,roof_connector_y_size,radius],
        //light fitting connector
        [light_fitting_x_size,roof_connector_y_size + light_fitting_y_size,radius],
        [roof_connector_x_size + light_fitting_x_size,roof_connector_y_size + light_fitting_y_size,radius],


        //right side of roof connector
        [roof_connector_x_size + light_fitting_x_size,roof_connector_y_size,radius],
        [bottom_start_x + roof_connector_x_size,0,radius]
        ], fn=10));

}

module dividers(divider_gap_size=5, radius = 10, z_size = 10, segments = 5 ) {
    for ( x = [0 : 360/segments: 360] ){
        //for x in range(0, 360, int(360 / segment_count)):
        //x = 0;
        rotate(up_vec(x))
        left(divider_gap_size/2)//Just centering the square
        linear_extrude(z_size)
        square([divider_gap_size, radius]);
    }
}


difference(){
    divider_max_width_required = bottom_start_x + roof_connector_x_size;
    rotate_extrude(angle = 360, convexity = 200, $fn = 80) 
    2dConnectorShape();
    dividers(radius = divider_max_width_required, 
            z_size = roof_connector_y_size, 
            segments = 10);
}
