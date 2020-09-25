function up_vec(up_amount) = [0,0,up_amount];
module up(up_amount){
    translate(up_vec(up_amount)){children();}
}
module down(down_amount){
    translate(up_vec(-down_amount)){children();}
}

function front_vec(front_amount) = [0,front_amount,0];
module front(front_amount){
    translate(front_vec(front_amount)){children();}
}
module back(back_amount){
    translate(front_vec(-back_amount)){children();}
}

function right_vec(right_amount) = [right_amount,0,0];
module right(right_amount){
    translate(right_vec(right_amount)){children();}
}
module left(left_amount){
    translate(right_vec(-left_amount)){children();}
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