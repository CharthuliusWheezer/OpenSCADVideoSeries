


step1 = .01;
step2 = .02;
to = 1;

function Rho(P, T) = 
20 + 10 * sin(5*P) * cos(3*T);
for(i = [0:step1:to], j = [0:step2:to]){

	phi = 180*i;
	phi2 = 180*(i+step1);
	
	theta = 360*j;
	theta2 = 360*(j+step2);
	
	s = .01;
	thickness = 2;

	//upper triangle
	color([
	(sin(5*phi)+1)/2, 
	(cos(3*theta)+1)/2, 
	(sin(5*phi-3*theta*sin(theta))+1)/2
	])
	hull(){
	rotate([0, 0, theta])
	rotate([0, phi, 0])
	translate([0, 0, Rho(phi, theta)])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta2])
	rotate([0, phi, 0])
	translate([0, 0, Rho(phi, theta2)])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta])
	rotate([0, phi2, 0])
	translate([0, 0, Rho(phi2, theta)])
	cube(size = s, center =  true);
		
		
	rotate([0, 0, theta])
	rotate([0, phi, 0])
	translate([0, 0, Rho(phi, theta)-thickness])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta2])
	rotate([0, phi, 0])
	translate([0, 0, Rho(phi, theta2)-thickness])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta])
	rotate([0, phi2, 0])
	translate([0, 0, Rho(phi2, theta)-thickness])
	cube(size = s, center =  true);
		
	
	}
	
	//lower triangle
	color([
	(sin(5*phi)+1)/2, 
	(cos(3*theta)+1)/2, 
	(sin(5*phi-3*theta*sin(theta))+1)/2
	])
	hull(){
	rotate([0, 0, theta2])
	rotate([0, phi2, 0])
	translate([0, 0, Rho(phi2, theta2)])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta2])
	rotate([0, phi, 0])
	translate([0, 0, Rho(phi, theta2)])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta])
	rotate([0, phi2, 0])
	translate([0, 0, Rho(phi2, theta)])
	cube(size = s, center =  true);
		
		
	rotate([0, 0, theta2])
	rotate([0, phi2, 0])
	translate([0, 0, Rho(phi2, theta2)-thickness])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta2])
	rotate([0, phi, 0])
	translate([0, 0, Rho(phi, theta2)-thickness])
	cube(size = s, center =  true);
	
	rotate([0, 0, theta])
	rotate([0, phi2, 0])
	translate([0, 0, Rho(phi2, theta)-thickness])
	cube(size = s, center =  true);
		
	}
	
	
	
}