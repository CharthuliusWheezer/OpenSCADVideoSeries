
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

////the first set of example shapes
////RADIUS should probably be set to 1
////rotations should be set to 4
//module part_1(interpolator){
//
//    height = 1 + interpolator;
//
//    translate([0, 0, height/2])
//    cube([
//    10 + interpolator,
//    10 + interpolator,
//    height], center=true);
//
//}
//
//
//module part_2(interpolator){
//
//    radius = 1 + interpolator;
//
//    translate([5, 5, 2.0])
//    sphere(r = radius, $fn=30);
//
//}

//the first part to blend between
module part_1(interpolator){

    radius = 1 + interpolator;

    sphere(r = radius, $fn=30);

}


//the second part to blend between
module part_2(interpolator){

    radius = 1 + interpolator;

    //translate([3+.5*sin($t*360), 0, 0])
    translate([3.0, 0, 0])
    sphere(r = radius, $fn=30);

}

//the number of steps in the blend/fillet
steps = 20;

//the radius of the blend/fillet
RADIUS = 1.9;
//RADIUS = 1.9+sin($t*360);

//the number of extra rotations
rotations = 6;

for(j = [0:rotations-1]){
//extra rotations
rotate([0, 0, j*360/rotations])
for(i = [0:steps-2]){

    i2 = i+1;
    
    //generate the interpolator functions
    iterator_plus = f_plus(i, steps, RADIUS);
    
    iterator_minus = f_minus(i, steps, RADIUS);
    
    
    iterator_plus_2 = f_plus(i2, steps, RADIUS);
    
    iterator_minus_2 = f_minus(i2, steps, RADIUS);
    
    //translate([11*i, 0, 0])
    //color([.5, .5, .5, .3])
    
    //the chained hull of intersections
    //of the interpolated shapes
    color([.2+i/steps/2, .6-i/steps/2, .8, .3])
    hull(){
        intersection(){
            part_1(iterator_plus);
            part_2(iterator_minus);
        }
        
        intersection(){
            part_1(iterator_plus_2);
            part_2(iterator_minus_2);
        }
    }

}
}

//placing the original part_1
color([.2, .6, .8, .3])
part_1(0);

//rotating and placing the orginal part_2
for(j = [0:rotations-1]){
rotate([0, 0, j*360/rotations])
color([.2+(steps-2)/steps/2, .6-(steps-2)/steps/2, .8, .3])
part_2(0);
}




