function x(rho, phi, theta)
= rho*sin(phi)*cos(theta);

function y(rho, phi, theta)
= rho*sin(phi)*sin(theta);

function z(rho, phi)
= rho*cos(phi);


Rho = 10;
Phi  = 45;
Theta = 45;
















dia = .5;

	X = x(Rho, Phi, Theta);
	Y = y(Rho, Phi, Theta);
	Z = z(Rho, Phi);



//theta
color([.1,.1,.6, .5])
intersection(){
union(){
hull(){
	rotate([0,0,atan2(Y, X)])
	translate([Rho, 0, 0])
	cube(size = dia/2.05, center =  true);
	
	cube(size = dia/2.05, center =  true);
	
		rotate([0,0,90*floor((Theta%360)/90)])
		translate([Rho,0,0])
		cube(size = dia/2.05, center =  true);
}
	
	if(Theta > 90){
		for(i = [0:90:Theta-90]){
			hull(){
				cube(size = dia/2.05, center =  true);
				rotate([0,0,i])
				translate([Rho,0,0])
				cube(size = dia/2.05, center =  true);
				
				rotate([0,0,i+90])
				translate([Rho,0,0])
				cube(size = dia/2.05, center =  true);
			}
		}
	}
}


cylinder(r = Rho/5, $fn = 100, h = dia/2.1, center =  true);

}

	
	
	
	//phi
color([2*75/255, 0, 230/255, .5])
intersection(){	
	rotate([0,0,atan2(Y, X)])
	rotate([90,0,0])
	cylinder(r = Rho/5, $fn = 100, h = dia/2.1, center =  true);
	hull(){
	translate([X, Y, Z])
	sphere(d = dia/2.05, $fn = 20);
	
	sphere(d = dia/2.05, $fn = 20);

	translate([0, 0, Rho])
	sphere(d = dia/2.05, $fn = 20);
	}

}
	
	
	
//point
translate([X, Y, Z])
	sphere(d = dia, $fn = 100);


	//Rho 3d Rho
	color([.2,.3,.4])
	hull(){
		translate([X, Y, Z])
		sphere(d = dia/2, $fn = 20);
		
		sphere(d = dia/2, $fn = 20);
	}
	
	
	//2d Rho
	color([1, 1, 0])
	hull(){
		translate([X, Y, 0])
		sphere(d = dia/2, $fn = 20);
		
		sphere(d = dia/2, $fn = 20);
	}
	

	
	
	

	//x component
		translate([0, Y, 0])
	rotate([0, 90*sign(X), 0])
	color([1, 0, 0])
	cylinder(d = dia/2, center = false, $fn = 200, h = abs(X));



	//y component
	translate([X, 0, 0])
	rotate([-90*sign(Y), 0, 0])
	color([0, 1, 0])
	cylinder(d = dia/2, center = false, $fn = 200, h = abs(Y));
	
	
	//z component
		//x component
		translate([X, Y, 0])
	rotate([90*(1- sign(Z)), 0, 0])
	color([0, 0, 1])
	cylinder(d = dia/2, center = false, $fn = 200, h = abs(Z));
	
	







//axes
color([1,0,0, .5])
rotate([0,90,0])
cylinder(d = dia, center = true, $fn = 200, h = 200);

color([0,1,0, .5])
rotate([90,0,0])
cylinder(d = dia, center = true, $fn = 200, h = 200);

color([0,0,1, .5])
cylinder(d = dia, center = true, $fn = 200, h = 200);



color([.4, .5, .6, .4])
sphere(r = Rho, $fn = 200);











