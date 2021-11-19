
//rotate a child object to point at a particular point

module point(p){

	//coordinates of the point
	x = p[0];
	y = p[1];
	z = p[2];

	//distance from the origin to the x-y coordinate
	R = norm([x, y]);

	//rotation around the z axis
	theta = atan2(y, x);

	//angle between the z axis and the x-y-plane
	alpha = atan2(z, R);


	//visualize theta
	//angle
	color([.2, .3, .7, .5])
	rotate_extrude(angle=theta, $fn = 100)
	translate([1, 0, 0])
	square([2, .05], center=true);

	//text
	color(1.4*[.2, .3, .7])
	rotate([0, 0, theta/2])
	translate([2.1, 0, 0])
	rotate([0, 0, -theta/2])
	rotate([45, 0, 0])
	linear_extrude(height=0.05)
	text("theta", size=1/8);



	//visualize alpha
	//angle
	color([.8, .3, .2, .5])
	rotate([0, 0, theta])
	rotate([90, 0, 0])
	rotate_extrude(angle=alpha, $fn = 100)
	translate([1, 0, 0])
	square([2, .05], center=true);

	//text
	color(1.1*[.8, .3, .2])
	rotate([0, 0, theta])
	rotate([0, -alpha/2, 0])
	translate([2.1, 0, 0])
	rotate([0, alpha/2, 0])
	rotate([0, 0, -theta])
	rotate([45, 0, 0])
	linear_extrude(height=0.05)
	text("alpha", size=1/8);


	//show the componenets
	//[[position1], [position2], [color]]
	for(p = [[[0, 0, 0], [x, 0, 0], [0, 1, 0]],
				  [[0, 0, 0], [x, y, 0], [0, 1, 1]],
				  [[x, 0, 0], [x, y, 0], [1, 1, 0]],
				  [[x, y, 0], [x, y, z],  [1, 0, 1]],
				  [[0, 0, 0], [x, y ,z], [1, 1, 1]]]){
		
		color(p[2])
		hull(){
			translate(p[0])
			cube(size=1/16, center=true);
			
			translate(p[1])
			cube(size=1/16, center=true);
		}
	}

	//X
	color([0, 1, 0])
	translate([x/2, -1/2, 0])
	rotate([45, 0, 0])
	linear_extrude(height=0.05)
	text("X", size=1/4);

	//R
	color([0, 1, 1])
	translate([2/3*x, 2/3*y + 1/4, 0])
	rotate([45, 0, 0])
	linear_extrude(height=0.05)
	text("R", size=1/4);

	//Y
	color([1, 1, 0])
	translate([x+1/4, y/2, 0])
	rotate([45, 0, 0])
	linear_extrude(height=0.05)
	text("Y", size=1/4);

	//Z
	color([1, 0, 1])
	translate([x+1/4, y, z/2])
	rotate([45, 0, 0])
	linear_extrude(height=0.05)
	text("Z", size=1/4);

	//point the object in the direction specified
	rotate([0, 0, theta])
	rotate([0, -alpha, 0])
	rotate([0, 90, 0])
	children();

}


//the test point, the point to be pointed to
test_point = [2+5*cos(360*$t),3 + 5*sin(360*$t),4+5*cos(3*360*$t)]/2;



//rotate the cone to point at the test point
point(test_point)
color([.5, .7, .4, .7])
cylinder(r1=1/2, r2=0.01, center=true, $fn=100, h=2);







//place the cone in a different location in space
//but still have it point toward the test point
moved_center = [2, 2, 3];

//uncomment to run this part of the code
/*
translate(moved_center)
point(test_point - moved_center)
color([.5, .7, .4, .7])
cylinder(r1=1/2, r2=0.01, center=true, $fn=100, h=2);
*/



//visualize the test point
translate(test_point)
color([1, 0, 0, 0.5])
cube(size=1/3, center=true);



























