thickness = 2.3;
totalTriangleWidth=20;

module flatBase() {
    translate ( v = [-50, -50, -0.5]) { 
        linear_extrude(height = 1, center = true, convexity = 10, twist = 0) {

            square(1000,0);
        }
    }

}

module triangle() {    
    linear_extrude(height = 1.5, center = true, convexity = 10, twist = 0) {
    difference() {
        totalHeight=totalTriangleWidth*sqrt(3)/2;
        
        polygon(points=[[0,0],[totalTriangleWidth/2,totalHeight],[totalTriangleWidth,0]]);
        
        polygon(points=[
            [sin(60) *thickness,cos(60) * thickness],
            [totalTriangleWidth/2, totalHeight-thickness],
            [totalTriangleWidth - sin(60) *thickness,cos(60) * thickness]
        ]);
    }  
  }
}


module joinedTriangles() {
    translate( v = [0 , 0, -0.2]) {
         rotate(a=[120,0,0])
         {
            
            triangle();
            
        }
    }

    translate ( v = [9.95,-5, -0.2]) { 
        rotate(a=[60,0,0])
         {
            
            triangle();
         }
            
        
    }

}
difference() {
    spacing = totalTriangleWidth;

     for (a =[0:spacing:spacing*9]) {
        translate(v =[a,0,0]) {
            joinedTriangles();
        }
     }
    flatBase();
}
