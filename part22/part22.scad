step = 0.05;

to = 3;

function f(p, q) = cos(40*(p*p+q*q));

extra_height = .5;
color([.7,.2,.4,1])
for(a = [-1:step:1-step], b = [-1:step:1-step]){
	
	x = a*to;
	y = b*to;
	//x plus step
	xps = (a+step)*to;
	//y plus step
	yps = (b+step)*to;
	s = 0.01;
	
	//lower triangle
	hull(){
	//(x, y)
	translate([x, y, f(x, y)])
	cube(size = s, center = true);
	
	//(x, y+step)
	translate([x, yps, f(x, yps)])
	cube(size = s, center = true);
	
	//(x+step, y)
	translate([xps, y, f(xps, y)])
	cube(size = s, center = true);
		
		
	//with extra height
	//(x, y)
	translate([x, y, f(x,y)+extra_height])
	cube(size = s, center = true);
	
	//(x, y+step)
	translate([x, yps, f(x, yps)+extra_height])
	cube(size = s, center = true);
	
	//(x+step, y)
	translate([xps, y, f(xps, y)+extra_height])
	cube(size = s, center = true);		
	}
	
	//upper triangle
	hull(){
	//(x+step, y+step)
	translate([xps, yps, f(xps, yps)])
	cube(size = s, center = true);
	
	//(x, y+step)
	translate([x, yps, f(x, yps)])
	cube(size = s, center = true);
	
	//(x+step, y)
	translate([xps, y, f(xps, y)])
	cube(size = s, center = true);
		
	//with extra height
	//(x+step, y+step)
	translate([xps, yps, f(xps, yps)+extra_height])
	cube(size = s, center = true);
	
	//(x, y+step)
	translate([x, yps, f(x, yps)+extra_height])
	cube(size = s, center = true);
	
	//(x+step, y)
	translate([xps, y, f(xps, y)+extra_height])
	cube(size = s, center = true);
	}	
}
