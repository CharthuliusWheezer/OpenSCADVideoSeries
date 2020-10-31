/*
difference(){
	union(){
	rotate([0,0,45])
	cube([30, 5, 10], center =  true);
cube(size = 10, center =  true);
	}
cylinder(d = 5, center =  true, h = 11, $fn = 100);
}
*/


/*
import("./part20_shape1.stl");
*/
/*
hull(){
translate([50,0])
circle(d = 10, $fn = 100);
translate([0,50])
circle(d = 10, $fn = 100);
circle(d = 10, $fn = 100);
}
*/
rotate([0,0,45])
import("./part20_2dshape.dxf");


// Be sure to have the object files in the same directory as this .scad file 
// so the program knows where to look for the objects. 





























