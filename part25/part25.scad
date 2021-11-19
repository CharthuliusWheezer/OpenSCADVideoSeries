

//the module to rotate an object in the direction of a point
module point_to(location){

	//coordinates of the point
	x = location[0];
	y = location[1];
	z = location[2];

	//distance from the origin to the x-y coordinate
	R = norm([x, y, 0]);

	//angle between the z axis and the x-y-plane
	alpha = atan2(z, R);

	//rotation around the z axis
	theta = atan2(y, x);

	//rotate the object
	rotate([0, 0, theta])
	rotate([0, -alpha, 0])
	rotate([0, 90, 0])
	children();

}

//point to point to
point = [3, 4, 5 * cos(360*$t) + 5];

//number of objects
num = 40;

for(i = [0:num-1]){

rad = 9;

//position of the cones
cone_position = [
rad*cos(i*360/num + 360*$t), 
rad*sin(i*360/num + 360*$t), 
10];

//create and move the cones
color([i/(num-1), .3, 1-i/(num-1)])
translate(cone_position)
point_to(point - cone_position)
cylinder(r1=1/2, r2=0, center=true, $fn=100, h = 5);

//visualize the point that is being pointed to
translate(point)
%cube(size=1/4, center=true);

//visualize the line between the object and the point
color([1, 0, 0, .5])
hull(){
translate(cone_position)
cube(size=0.05, center=true);

translate(point)
cube(size=0.05, center=true);

}

}




