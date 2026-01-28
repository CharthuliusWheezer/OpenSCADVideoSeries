
function f_plus(I, num_steps, d) =
let(t = 180 + 90*I/(num_steps-1))
d*cos(t) + d;

function f_minus(I, num_steps, d) =
let(t = 180 + 90*I/(num_steps-1))
d*sin(t) + d;

//module part_1(interpolator){
//
//    height = 1 + interpolator;
//    translate([0, 0, height/2])
//    cube([10 + interpolator, 10 + interpolator, height], center=true);
//}
//
//module part_2(interpolator){
//
//    radius = 1.2 + interpolator;
//    translate([5, 5, 2])
//    sphere(r=radius, $fn=100);
//}

module part_1(interpolator){

    radius = 3 + interpolator;
    translate([0, 0, 0])
    sphere(r=radius, $fn=100);
}

module part_2(interpolator){

    radius = 3 + interpolator;
    translate([8+2*sin(360*$t), 0, 0])
    sphere(r=radius, $fn=100);
}

steps = 15;

RADIUS = 4;

for(j = [0:5]){
    rotate([0, 0, j*360/6])
    for(i = [0:steps-2]){

        i2 = i + 1;
        
        interpolator_plus = f_plus(i, steps, RADIUS);
        interpolator_minus = f_minus(i, steps, RADIUS);
        
        interpolator_plus_2 = f_plus(i2, steps, RADIUS);
        interpolator_minus_2 = f_minus(i2, steps, RADIUS);
        
        //translate([i*11, 0, 0])
        color([.2+i/steps/2, .6-i/steps/2, .8, .3])
        hull(){
            intersection(){
                part_1(interpolator_plus);
                part_2(interpolator_minus);
            }
            
            intersection(){
                part_1(interpolator_plus_2);
                part_2(interpolator_minus_2);
            }
        }
    }
}

color([.2, .6, .8, .3])
part_1(0);

for(j = [0:5]){
    rotate([0, 0, j*360/6])
    color([.2+(steps-2)/steps/2, .6-(steps-2)/steps/2, .8, .3])
    part_2(0);
}












