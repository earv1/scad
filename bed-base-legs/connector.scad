include <../lib/Round-Anything/polyround.scad>

side_height=25.7;
//side
side_width=25.2;
//middle
side_width=49.50;

foot_z_size = 12;
rod_z_size = side_height;
rod_y_size = side_width;
connector_y_size = 15;

//side
extra_outer_connector_z_size = 20 ;
//middle
extra_outer_connector_z_size = 0 ;

total_x_size = 50;
//total_x_size = 8;

function up_array(up_amount) = [0,0,up_amount];
module up(up_amount){
    translate(up_array(up_amount)){children();}
}
module down(down_amount){
    translate(up_array(-down_amount)){children();}
}

function front_array(front_amount) = [0,front_amount,0];
module front(front_amount){
    translate(front_array(front_amount)){children();}
}
module back(back_amount){
    translate(front_array(-back_amount)){children();}
}

function right_array(right_amount) = [right_amount,0,0];
module right(right_amount){
    translate(right_array(right_amount)){children();}
}
module left(left_amount){
    translate(right_array(-left_amount)){children();}
}

module display_directions(distance_from_center=40){
    right(distance_from_center){
        color("orange"){
        text("right -x →");};
    }

    rotate(90)
    right(distance_from_center){
        color("orange"){
        text("front -y →");};
    }

    left(distance_from_center + 40){
        color("orange"){
        text("← left");};
    }

    rotate(90)
    left(distance_from_center + 40){
        color("orange"){
        text("← back");};
    }

    rotate([0, 90, 0])
    left(distance_from_center + 40){
        color("orange"){
        text("← up -z");};
    }

    rotate([0, 90, 0])
    right(distance_from_center){
        color("orange"){
        text("down →");};
    }
}


function rounded_square_pts(x_width, y_width, radius=2)=[
    [0,0,radius],[0,y_width,radius],
    [x_width,y_width,radius],[x_width,0,radius]];


module foot(foot_z_size, foot_y_size, foot_x_size)  {
    linear_extrude(height=foot_z_size){
        polygon(polyRound(rounded_square_pts(foot_y_size,foot_x_size), fn=10));
    }
}

module connector(connector_height, connector_length, connector_width)  {
    extrudeWithRadius(length=connector_height,r1=0,r2=2,fn=20){
        polygon(polyRound(rounded_square_pts(connector_width,connector_length), fn=10));
    }
}

//Leg
module leg(){

    color("orange"){
        union(){
        foot(foot_z_size, total_x_size, rod_y_size + connector_y_size *2);
        up(foot_z_size){
                connector(rod_z_size, connector_y_size, total_x_size);
                front(rod_y_size + connector_y_size){
                    connector(rod_z_size + extra_outer_connector_z_size, connector_y_size, total_x_size);
                };
        };
        }
    };


}

module pole(){
        color("DarkGray") {
        front(connector_y_size)up(foot_z_size){
                linear_extrude(rod_z_size){
                        square([200,rod_y_size], center=false);
                };
            }
        }
}

leg();
//pole();



//display_directions();