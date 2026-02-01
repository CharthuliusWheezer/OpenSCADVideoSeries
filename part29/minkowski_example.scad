






//section of the demo to view
part = 0;


//custom shape parameter
n = 5;

if(part == 0){
    // 2d minkowski demo
    minkowski(){
        //2d shape 1
        translate([0, -4])
        rotate([0, 0, -80])
        intersection(){
            translate([2.5, 0])
            circle(r = 3, $fn=100);
            
            translate([-2.5, 0])
            circle(r = 3, $fn=100);
        }
        
        //2d shape 2
        intersection(){
            translate([2.5, 0])
            circle(r = 3, $fn=100);
            
            translate([-2.5, 0])
            circle(r = 3, $fn=100);
        }
    }
}
else if(part == 1){
    minkowski(){
    
        //custom shape 1
        difference(){
            cylinder(r = 5, h = 1/2, center=true, $fn=30);
            for(i = [0:n]){
                rotate([0, 0, i*360/n])
                translate([8, 0, 0])
                scale([3, 2, 1])
                rotate([0, 0, 45])
                cube([3, 3, 1], center=true);
            }
        }

        //custom shape 2
        union(){
            rotate([15, 0, 0])
            cube([.1, .1, 100], center=true);

            rotate([-15, 0, 0])
            cube([.1, .1, 100], center=true);
        }
    }
    
    
    //custom shape 1 moved over
    translate([20, 0, 0])
    difference(){
        cylinder(r = 5, h = 1/2, center=true, $fn=30);
        for(i = [0:n]){
            rotate([0, 0, i*360/n])
            translate([8, 0, 0])
            scale([3, 2, 1])
            rotate([0, 0, 45])
            cube([3, 3, 1], center=true);
        }
    }

    //custom shape 2 moved over
    translate([40, 0, 0])
    union(){
        rotate([15, 0, 0])
        cube([.1, .1, 100], center=true);

        rotate([-15, 0, 0])
        cube([.1, .1, 100], center=true);
    }  
}

else if(part == 2){

    //minkowski shape expansion of a custom shape

    // This radius controls the radius of the sphere
    // that is used in the operation with the custom
    // shape. Changing it will change how far the
    // new surface extends from the original shape's
    // surface
    radius = +1;
    
    minkowski(){

        difference(){

            cylinder(r = 5, h = 1/2, center=true, $fn=30);

            for(i = [0:n]){

                rotate([0, 0, i*360/n])
                translate([8, 0, 0])
                scale([3, 2, 1])
                rotate([0, 0, 45])
                cube([3, 3, 1], center=true);

            }

        }
        
        sphere(r = radius, $fn=30);
    
    }
}


else if(part == 3){
    L = 1;

    //minkowski shape expansion
    cube(size=1, center=false);

    translate([1, 0, 1])
    rotate([0, 45, 0])
    translate([0, .3, L/2])
    cube([.05, .05, L], center=true);

    color([.7, .7, .7, .3])
    minkowski(){
        cube(size=1, center=false);
        sphere(r=L, $fn=100);
    }

    
    
    //normal shape expansion 
    translate([3, 0, 0]){ 
    cube(size=1, center=false);    
        
    color([.7, .7, .7, .3])
    cube(size=1+1, center=false);
    }



echo(sqrt(1*1 + 1*1));

}














