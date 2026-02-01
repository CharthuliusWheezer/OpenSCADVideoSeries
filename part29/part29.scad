
//interpolator functions
//I : the value of the iterator ie. 0 up to the number of steps - 1
//num_steps : the number of steps in the interpolation
//d : the radius of the circle that the functions make
function f_plus(I, num_steps, d) =
let(t = 180 + 90*I/(num_steps-1))
d*cos(t) + d;

function f_minus(I, num_steps, d) =
let(t = 180 + 90*I/(num_steps-1))
d*sin(t) + d;

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

// The new shape generator
// which uses the offset module
module part_1(interpolator){

    height = 1;

    translate([0, 0, height/2])
    offset3d(interpolator, 30)
    cube([10,10,height], center=true);
}

// Sphere generator
// with interpolator variable
module part_2(interpolator){

    radius = 1 + interpolator;

    translate([5, 5, 2.0])
    sphere(r = radius, $fn=30);
}

// The blend operator
// steps (int) the number of steps to use in the blending
//  operation
// RADIUS (float) a guiding parameter for how large or
// small the radius between shapes should be
// FN (int) the fineness of the sphere used to expand the
// shapes 
module blend(steps, RADIUS, FN){

    for(i = [0:steps-2]){

        i2 = i+1;
        
        //generate the interpolator functions
        iterator_plus = f_plus(i, steps, RADIUS);
        
        iterator_minus = f_minus(i, steps, RADIUS);
        
        
        iterator_plus_2 = f_plus(i2, steps, RADIUS);
        
        iterator_minus_2 = f_minus(i2, steps, RADIUS);
        
        //the chained hull of intersections
        //of the interpolated shapes
        color([.2+i/steps/2, .6-i/steps/2, .8, .3])
        hull(){
        
            //offset each shape in 3d using the offset
            //module
            intersection(){
                offset3d(iterator_plus, FN)
                children(0);
                
                offset3d(iterator_minus, FN)
                children(1);
            }
            
            //second component for chained hull
            intersection(){
                offset3d(iterator_plus_2, FN)
                children(0);
                
                offset3d(iterator_minus_2, FN)
                children(1);
            }
        }
    }

    //placing the first original part
    color([.2, .6, .8, .3])
    children(0);

    //placing the second original part
    color([.2+(steps-2)/steps/2, .6-(steps-2)/steps/2, .8, .3])
    children(1);
}

//example 1
//blend(20, 1, 30){
//    part_1(0);
//    part_2(0);
//}

//example 2
blend(20, 1, 30){
    cube([10, 10, 1], center=true);
    
    translate([4, 0, 0])
    rotate([0, 45, 45])
    cube([10, 10, 1], center=true);
}


//example 3
//blend(20, 1, 30){
//    rotate([30, 0, 0])
//    translate([0, 0, 5])
//    rotate([90, 0, 0])
//    cube([10, 10, 1], center=true);
//    
//    translate([0, 0, 0])
//    rotate([0, 0, 0])
//    cylinder(r1=2, r2=0.1, h=10, center=true, $fn=30);
//}







