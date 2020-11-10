
/*
for(i = [-100:20:100 - 20]){
hull(){
//fist object
translate([i, i*i/100, 0])
cube(size = 10, center = true);
	
//second object
i2 = i+20;
translate([i2, i2*i2/100, 0])
cube(size = 10, center = true);
	}
}
*/
/*
step_a = 2;
for(i = [-100:step_a:100 - step_a]){
hull(){
//fist object
translate([i, i*i/100, 5*sin(2*i)])
cube(size = 10, center = true);
	
//second object
i2 = i+step_a;
translate([i2, i2*i2/100,  5*sin(2*i2)])
cube(size = 10, center = true);
	}
}
*/
/*
rotate_extrude($fn = 100)
translate([50,0,0])
circle(r = 10, $fn = 100);
*/

t_rad = 50;

c_rad = 10;
rotations = 10;

step = 0.001;
for(q = [0:step:1]){
hull(){
rotate([0,0,360*q])
translate([t_rad,0,0])
rotate([0,-rotations*360*q,0])
translate([c_rad,0,0])
rotate([90,0,0])
//sphere(r = 1, $fn = 25);
cylinder(r = 1, center =  true, $fn = 25, h = 0.001);
	
q2 = q+step;

rotate([0,0,360*q2])
translate([t_rad,0,0])
rotate([0,-rotations*360*q2,0])
translate([c_rad,0,0])
rotate([90,0,0])
	//sphere(r = 1, $fn = 25);
cylinder(r = 1, center =  true, $fn = 25, h = 0.001);
}
}



























