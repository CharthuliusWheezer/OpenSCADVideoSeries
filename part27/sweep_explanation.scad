

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


module arrow(length, location, head_length, width_multiplier=1){

    base_rad = width_multiplier*length/10;
    
    head_rad = 2*width_multiplier*length/10;

	point_to(location)
	union(){
		cylinder(h=length-head_length, r=base_rad, center=false, $fn=40);

		translate([0, 0, length-head_length])
		cylinder(h=head_length, r1=head_rad, r2=0, center=false, $fn=40);

	}


}




//function x(t) = let(q=360*t) (10-5*sin(4*q))*cos(6*q) + cos(7*6*q)/2;
//
//function y(t) = let(q=360*t) (10-5*cos(4*q))*sin(6*q) + sin(7*6*q)/2;
//
//function z(t) = 20*t - 10;




function x(t) = let(q=360*t) 10*cos(q);

function y(t) = let(q=360*t) 10*sin(q);

function z(t) = let(q=360*t) 5*cos(10*q);


steps = 300;

points = [for(i = [0:steps-1]) let(T = i/(steps-1)) [x(T), y(T), z(T)]];











demo_value = -1;


//vector addition and subtraction and norm

if(demo_value == -1){
    
    
    p1 = [-7, 0, 10];
    
    p2 = [5, 0, 20];
    
    p3 = p1 + p2;
    
    p4 = p2 - p1;
    
    
    echo("point 1 red");
    echo(p1);
    echo("\n");
    
    echo("point 2 blue");
    echo(p2);
    echo("\n");
    
    echo("point 3 purple");
    echo(p3);
    echo("\n");
    
    echo("point 4 green");
    echo(p4);
    echo("\n");
    
    
    color([1, 0, 0, .5])
    arrow(norm(p1), p1, norm(p1)/4, width_multiplier=0.25);
    
    translate(p1 + [-4, 0, 0])
    rotate([90, 0, 0])
    color([1, 0, 0, .5])
    linear_extrude(height=0.1)
    text("p1", size=2);
    
    
    color([.2, .2, 1, .7])
    arrow(norm(p2), p2, norm(p2)/4, width_multiplier=0.25);
    
    translate(p2 + [1, 0, 0])
    rotate([90, 0, 0])
    color([.2, .2, 1, .7])
    linear_extrude(height=0.1)
    text("p2", size=2);
    
    
    addition = false;
    
    subtraction = true;
    
    
    if(subtraction){
    
        color([0, 1, 0, .7])
        arrow(norm(p4), p4, norm(p4)/4, width_multiplier=0.15);
        
        
        translate(p4 + [1, 0, 0])
        rotate([90, 0, 0])
        color([0, 1, 0, .7])
        linear_extrude(height=0.1)
        text("p2 - p1", size=2);
        
        translate(p1)
        color([0, 1, 0, .7])
        arrow(norm(p4), p4, norm(p4)/4, width_multiplier=0.15);
        
        translate(p4)
        color([1, 0, 0, .5])
        arrow(norm(p1), p1, norm(p1)/4, width_multiplier=0.25);
    }
    
    if(addition){
    
        color([1, 0, 1, .5])
        arrow(norm(p3), p3, norm(p3)/4, width_multiplier=0.15);
        
        
        translate(p1)
        color([.2, .2, 1, .7])
        arrow(norm(p2), p2, norm(p2)/4, width_multiplier=0.25);
        
        
        translate(p2)
        color([1, 0, 0, .5])
        arrow(norm(p1), p1, norm(p1)/4, width_multiplier=0.25);
    }
    
    
    


}

//view the points
if(demo_value == 0){
    
	for(p = points){

		translate(p)
		cube(size=1/4, center=true);

	}

}

//chained hull
else if(demo_value == 1){
	cube_size = 1;
	for(p = [0:len(points)-2]){

		p1 = points[p];
		p2 = points[p+1];

		hull(){
			translate(p1)
			cube(size=cube_size, center=true);

			translate(p2)
			cube(size=cube_size, center=true);

		}

	}
}

//basic approximation
else if(demo_value == 2){
	cube_size = 1;
	for(p = [0:len(points)-2]){

		p1 = points[p];
		p2 = points[p+1];

		dir = p2 - p1;

		translate(p1)
		arrow(norm(dir), dir, norm(dir)/2);

	}
}


//better approximation
else if(demo_value == 3){
	cube_size = 1;

	for(p = [1:len(points)-2]){

		
		p0 = points[p-1];
		p1 = points[p];
		p2 = points[p+1];

		dir = p2 - p0;

		distance = norm(p2-p1);

		translate(p1)
		arrow(distance, dir, distance/2);

	}
}

//sweep basic
else if(demo_value == 4){
	R = 1;

	for(p = [0:len(points)-3]){

		p1 = points[p];
		p2 = points[p+1];
		p3 = points[p+2];

		dir1 = p2 - p1;

		dir2 = p3 - p2;

		hull(){
			translate(p1)
			point_to(dir1)
			cylinder(h=0.01, r=R, center=true, $fn=30);

			translate(p2)
			point_to(dir2)
			cylinder(h=0.01, r=R, center=true, $fn=30);
		}

	}
}


//sweep better
else if(demo_value == 5){
	R = 1;
	for(p = [1:len(points)-3]){

		p0 = points[p-1];
		p1 = points[p];
		p2 = points[p+1];
		p3 = points[p+2];

		dir1 = p2 - p0;

		dir2 = p3 - p1;

		hull(){
			translate(p1)
			point_to(dir1)
			cylinder(h=0.01, r=R, center=true, $fn=30);

			translate(p2)
			point_to(dir2)
			cylinder(h=0.01, r=R, center=true, $fn=30);
		}

	}
}

//basic vs better approximation
else if(demo_value == 6){
	
	cube_size = 1;
	
	pn1 = [-3, 0, 3];
	p0 = [0, 0, 0];
	p1 = [5, 0, 2];
	p2 = [8, 0, 8];
	p3 = [12, 0, 10];

	test_points = [pn1, p0, p1, p2, p3];

	//the distance between the examples
	extra = 30;


    extra_height = 15;
	for(test_point = test_points, j = [-1, 0, 1], k = [0, 1]){
		
		translate([extra*j, 0, k*extra_height])
		translate(test_point)
		cube(size=cube_size, center=true);
	}


	//basic approximation
	translate(p1)
	arrow(norm(p2-p1), p2-p1, norm(p2-p1)/2);
    
    translate(p1)
    translate([0, 0, extra_height])
    color([1, 0, 0, .5])
    arrow(norm(p2-p1), p2-p1, norm(p2-p1)/2);
    
    

	//better approximation
	translate([extra, 0, 0])
	translate(p1)
	arrow(norm(p2-p1), p2-p0, norm(p2-p1)/2);
    
    
    translate(p0)
    translate([extra, 0, extra_height])
    color([1, 0, 0, .5])
    arrow(norm(p2-p0), p2-p0, norm(p2-p0)/2, width_multiplier=0.5);


}














