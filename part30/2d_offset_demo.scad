
//The blending module for the 2d case
//R : (float), the radius of the curve
//FN : (int) the detail parameter for how smooth the curve should be
module blend_v3_2d(R, FN){

    difference(){
        square([999, 999], center=true);
        offset(r = R, $fn=FN)
        difference(){
            square([1000, 1000], center=true);
        
            offset(r = R, $fn=FN){
                children();
            }
        }
    }
}

part = 9;

// Note: for propper blending, the radius and extra_radius
// should be the same value
radius = +0.3;

extra_radius = +0.3;

// The first step for the blending
// creating the original part and offsetting it
// using the 2d offset function
if(part==0){
    
    offset(r = radius, $fn=100){
        square(size=2, center=true);

        translate([1, 1, 0])
        square(size=2, center=true);
    }
}

// The second part of the blending process
// creating a negative of the offset shape
if(part==1){

    difference(){
        // the large square to use for the negative
        square([10, 10], center=true);
    
        // the previous step
        offset(r = radius, $fn=100){
            square(size=2, center=true);

            translate([1, 1, 0])
            square(size=2, center=true);
        }
    }
}

// the third part of the blending process
// offsetting the negative
if(part==2){

    // Offsetting the negative inward
    offset(r = extra_radius, $fn=100)
    
    // The previous step
    difference(){
    
        square([10, 10], center=true);
    
        offset(r = radius, $fn=100){
            square(size=2, center=true);

            translate([1, 1, 0])
            square(size=2, center=true);
        }
    }
}


// the fourth part of the blending process
// subtracting the negative to get the new positive
if(part==3){

    difference(){
        // Anohter large square to use to subtract the
        // negative from
        square([9, 9], center=true);
        
        //the previous part
        offset(r = extra_radius, $fn=100)
        difference(){
        
            square([10, 10], center=true);
        
            offset(r = radius, $fn=100){
                square(size=2, center=true);

                translate([1, 1, 0])
                square(size=2, center=true);
            }
        }
    }
}

// Group of circles
if(part==4){
    for(i = [0:15]){          
        rotate([0, 0, i*360/7])
        translate([0, i/2])
        circle(r=1, $fn=50);
    }
}

// blending the circles together
// Note: the circles don't need to be individually
// blended to one another but are all blended simultaneously
if(part==5){

    circle_blend_radius = 1.5;

    //linear_extrude(height=10, center=true)
    //rotate_extrude($fn=50)
    //translate([30, 0])
    difference(){
    
        square([19, 19], center=true);
        
        offset(r = circle_blend_radius, $fn=100)
        difference(){
        
            square([20, 20], center=true);
        
            offset(r = circle_blend_radius, $fn=100){
                for(i = [0:15]){
                
                    rotate([0, 0, i*360/7])
                    translate([0, i/2])
                    circle(r=1, $fn=50);

                }
            }
        }
    }
}


//using the 2d blending module to get the same result
if(part==6){

    blend_v3_2d(+0.25, 20){
        square(size=2, center=true);

        translate([1, 1, 0])
        square(size=2, center=true);
    }
}

// Blending internal verticies for a wheel
if(part==7){
    blend_v3_2d(R=+0.95, FN=100){
        difference(){
            circle(r = 5, $fn=100);
            
            circle(r = 4, $fn=100);
        }
        
        for(i = [0:4]){
            rotate([0, 0, 360*i/5])
            translate([4.5/2, 0])
            square([4.5, 1/2], center=true);
        }
    }
}

// Example of blending with positive and negative radii
// the bottom part is unmodified and the top part is
// the rounded part

if(part==8){
    // Number of rotated shapes
    n = 14;
    
    rad = -0.4;

    // Top rounded part
    color([.2, .2, .7, .5])
    linear_extrude(height=1, center=false)
    offset(r=rad, $fn=100)
    offset(r=-rad, $fn=100)
    for(i=[0:n-1]){
        rotate([0, 0, i*360/n])
        
        scale([3, 1])
        rotate([0, 0, -45])
        square([1, 1], center=false);
    }
    
    // Bottom unchanged part
    color([.7, .2, .2, .5])
    translate([0, 0, -1])
    linear_extrude(height=1, center=false)
    for(i=[0:n-1]){
        rotate([0, 0, i*360/n])
        
        scale([3, 1])
        rotate([0, 0, -45])
        square([1, 1], center=false);
    }
}



// Example of blending both internal and external verticies
// simultaneously

if(part==9){

    // Number of rotated shapes
    n = 14;
    
    rad = -0.30;

    // Top rounded part
    color([.2, .2, .7, .5])
    linear_extrude(height=1, center=false)
    offset(r=-rad, $fn=100)
    offset(r=rad, $fn=100)
    offset(r=rad, $fn=100)
    offset(r=-rad, $fn=100)
    for(i=[0:n-1]){
        rotate([0, 0, i*360/n])
        
        scale([3, 1])
        rotate([0, 0, -45])
        square([1, 1], center=false);
    }
    
    // Bottom unchanged part
    color([.7, .2, .2, .5])
    translate([0, 0, -1])
    linear_extrude(height=1, center=false)
    for(i=[0:n-1]){
        rotate([0, 0, i*360/n])
        
        scale([3, 1])
        rotate([0, 0, -45])
        square([1, 1], center=false);
    }
}


