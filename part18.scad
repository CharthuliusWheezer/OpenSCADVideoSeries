/*
intersection(){

sphere(d = 7, $fn = 100);

intersection_for(i = [0:10-1]){
	rotate([0,0,360*i/10])
	cube(size = 5, center =  true);
	}
}
*/
/*
intersection_for(i = [0:30-1]){
	rotate([0,0,360*i/30])
	cube(size = 5, center =  true);
	}
	
	//sphere(d = 7, $fn = 100);
*/
/*
s = 5;
intersection_for(q = [0:s-1]){
rotate([0,0,360*q/s])
translate([5,0,0])
sphere(r = 10, $fn = 100);
}
*/





hull(){

cube([10,3,3], center = true);
cube([3,10,3], center = true);

rotate([0,-360*$t,0])
translate([100,0,0])
cube([10, 5, 30], center = true);
}








