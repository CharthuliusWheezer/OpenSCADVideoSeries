
//interpolation functions

//starts at 0 and moves up to d
function f_plus(I, num_steps, d) =
let(t = 180 + 90*I/(num_steps-1))
d*cos(t) + d;

//starts at d and moves down to 0
function f_minus(I, num_steps, d) =
let(t = 180 + 90*I/(num_steps-1))
d*sin(t) + d;


//number of points to graph
steps = 30;

//the height of the interpolator and the radius of the
//interpolation circle
D = 6;

//vizualization parameter for how far the interpolator functions go to
to = 10;

//vizualization parameter for the size of the cubes
cube_size = 1/4;

//demo part variable
//switches which part of the demo is being viewed (0 or 1)
part = 0;

//graphing the functions based on iteration
if(part == 0){
    for(i = [0:steps-1]){
        
        plus = f_plus(i, steps, D);
        
        minus = f_minus(i, steps, D);
        
        x = to * i / (steps-1);
        
        translate([x, plus, 0])
        color([.8, .2, .2, .7])
        cube(size=cube_size, center=true);
        
        translate([x, minus, 0])
        color([.2, .2, .8, .7])
        cube(size=cube_size*.999, center=true);
           
    }

    translate([to/2, D, 0])
    color([.2, .9, .2, .6])
    cube([to, 1/32, 1/4], center=true);

    translate([-1, D, 0])
    color([.2, .9, .2, .6])
    linear_extrude(height=0.1)
    text(str(D), size=1, valign="center");
}

//graphing the functions parametrically
//to show that they follow the curve of a circle
//centered at [D, D]
else if(part == 1){
    for(i = [0:steps-1]){
        
        plus = f_plus(i, steps, D);
        
        minus = f_minus(i, steps, D);
        
        x = to * i / (steps-1);
        
        //plus is used as the x co-ordinate
        //minus is useds as the y co-ordinate
        translate([plus, minus, 0])
        color([.8, .2, .8, .7])
        cube(size=cube_size, center=true);
        
        translate([plus, minus/2, 0])
        color([.8, .2, .2, .7])
        cube(size=[1/32, minus, 1/4], center=true);
        
        translate([plus/2, minus, 0])
        color([.2, .2, .8, .7])
        cube(size=[plus, 1/32, 1/4], center=true);  
    }
    
    translate([D, D, 0])
    color([.1, .9, 0, .3])
    cylinder(r=D, h=1/2, center=true, $fn=100);   
}


