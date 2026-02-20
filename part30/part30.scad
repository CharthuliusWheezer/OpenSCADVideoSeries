
//3d offsetting module
//R (float) the radius to offset the shape by
//FN (int) the fineness of the sphere to offset
//the shape with
module offset3d(R, FN){
    if(R <= 0){
        children(0);
    }
    else{
        // Offset the first child object using a sphere
        // and the minkowski operator
        minkowski(){
            sphere(r=R, $fn=FN);
            children(0);
        }
    }
}

// Blending module for internal edges and verticies of a part
// R (float) internal parmeter for generating the blend
// related to the radius of the blend curve
// FN (int) the fineness of the sphere to offset
// the shape with
module blend_v3_3d(R, FN){

    // Taking the negative of the negative to get the new positive
    difference(){
        cube([999, 999, 999], center=true);

        // Offsetting the negative
        offset3d(R, FN)
        
        // Taking the negative of the offset original shape
        difference(){
            cube([1000, 1000, 1000], center=true);

            // Offsetting the original shape in 3d
            offset3d(R, FN)
            // Original Shape
            children();
        }
    }
}

// Blending module for external edges and verticies of a part
// R (float) internal parmeter for generating the blend
// related to the radius of the blend curve
// FN (int) the fineness of the sphere to offset
// the shape with
module blend_v3_3d_negative(R, FN){

    // Offsetting the pseudo positive to get the new positive
    offset3d(R, FN)
    
    // Taking the negative of the negative to get a pseudo positive
    difference(){
        //translate([0, 999/2, 0])
        cube([999, 999, 999], center=true);

        // Offsetting the negative of the original shape
        offset3d(R, FN)
        // Taking the negative of the original shape
        difference(){
            //translate([0, 500, 0])
            cube([1000, 1000, 1000], center=true);

            // Original Shape
            children();
        }
    }
}

// Blending module for internal and external edges and verticies of a part
// R (float) internal parmeter for generating the blend
// related to the radius of the blend curve
// FN (int) the fineness of the sphere to offset
// the shape with
module blend_total(R, FN){
    
    // Blend the interior edges and vertices
    blend_v3_3d(R, FN)
    // Blend the exterior edges and verticies
    blend_v3_3d_negative(R, FN)
    //Original Shape
    children();
}

example = 3;

if(example==0){

    radius = 1;


    // Basic example of the 3d blending process


    // Taking the negative of the negative to get the new positive
    difference(){
        //translate([0, 999/2, 0])
        cube([999, 999, 999], center=true);

        // Offsetting the negative
        offset3d(radius, 20)
        
        // Taking the negative of the offset original shape
        difference(){
            //translate([0, 500, 0])
            cube([1000, 1000, 1000], center=true);


            // Offsetting the original shape in 3d
            offset3d(radius, 20)
            
            // Original Shape
            union(){
                cube(size=10, center=true);

                rotate([0, -45, 0])
                translate([12, 0, 0])
                rotate([0, 0, 45])
                cube(size=10, center=true);
            }
        }
    }
}

if(example==1){

    // Example of using the positive and negative blending modules

    // Positive
    blend_v3_3d(1, 20)
    union(){
        cube(size=10, center=true);

        rotate([0, -45, 0])
        translate([12, 0, 0])
        rotate([0, 0, 45])
        cube(size=10, center=true);
    }

    // Negative

    translate([25, 0, 0])
    blend_v3_3d_negative(1, 20)
    union(){
        cube(size=10, center=true);

        rotate([0, -45, 0])
        translate([12, 0, 0])
        rotate([0, 0, 45])
        cube(size=10, center=true);
    }
}

if(example==2){
    // Example of using the blending modules together

    blend_v3_3d(1, 20)
    blend_v3_3d_negative(1, 20)
    union(){
        cube(size=10, center=true);

        rotate([0, -45, 0])
        translate([12, 0, 0])
        rotate([0, 0, 45])
        cube(size=10, center=true);
    }
}

if(example==3){
    // Example of using the total blending module

    blend_total(1, 20)
    union(){
        cube(size=10, center=true);

        rotate([0, -45, 0])
        translate([12, 0, 0])
        rotate([0, 0, 45])
        cube(size=10, center=true);
    }
}

