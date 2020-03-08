var thickness = 2;

module flatBase(){
    translate ( v = [-50, -50, -0.5]) { 
        linear_extrude(height = 1, center = true, convexity = 10, twist = 0) {

            square(100,0);
        }
    }

}

module triangle() {    
    linear_extrude(height = 1.5, center = true, convexity = 10, twist = 0) {
    difference() {
        polygon(points=[[0,0],[10,18],[20,0]]);
        polygon(points=[[3,2],[10,15.5],[17,2]]);
    }  
  }
}


module joinedTriangles() {
    rotate(a=[90,0,0])
     {
        
        triangle();
        
    }
    translate ( v = [21.9,-10, 0]) { 
        rotate(a=[45,0,90])
         {
            
            triangle();
         }
            
        
    }

}
difference() {
    joinedTriangles();
    flatBase();
}
