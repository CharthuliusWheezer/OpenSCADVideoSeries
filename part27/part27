
//pointing function for direction objects
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


//creating trefoil knot with list comprehension
//refference
//https://en.wikipedia.org/wiki/Torus_knot
function X(t, a, b) = (cos(b*t) + 2)*cos(a*t);
    
function Y(t, a, b) = (cos(b*t) + 2)*sin(a*t);
    
function Z(t, a, b) = -sin(b*t);


function knot(p, q, steps) =

[
    for(i = [0:steps-1])
    let(I = 360*i / steps)
    [X(I, p, q), Y(I, p, q), Z(I, p, q)]
];



//demonstrate the pointing function
//point_to([1, 1, 1])
//cylinder(r1 = 0.2, r2 = 0.02, center=false, h = sqrt(3), $fn=50);
//
//translate([1,1,1])
//cube(size=0.1, center=true);

//create the poisitions to sweep along
values = knot(2, 3, 300);

//display the points   
//for(p = values){
//    translate(p)
//    cube(size=0.1, center=true);
//    }


type = 1;


//the first type of the sweep method
if(type == 0){
for(i = [0:len(values)-1]){
    
    //select the values from the list
    //while treating the list as a loop
    p0 = values[i];
    
    p1 = values[(i+1) % len(values)];
    
    p2 = values[(i+2) % len(values)];
    
    //calculate the necessesary directions from the points
    direction_0 = p1 - p0;
    
    direction_1 = p2 - p1;
    
    //direct, translate, and combine the objects
    //to make a chained hull
    hull(){
        translate(p0)
        point_to(direction_0)
        cylinder(r=0.1, h=0.01, center=true, $fn=4);
        
        translate(p1)
        point_to(direction_1)
        cylinder(r=0.1, h=0.01, center=true, $fn=4);
    }
}
}

//the second type of the sweep method
if(type == 1){
    

for(i = [0:len(values)-1]){
    
    //create iterators
    I = i / (len(values));
    I2 = (i+1) / (len(values));
    
    //select the values from the list
    //while treating the list as a loop
    pm1 = values[(i-1+len(values)) % len(values)];
    p0  = values[i];
    p1  = values[(i+1) % len(values)];
    p2  = values[(i+2) % len(values)];
    
    //calculate the necessesary directions from the points
    direction_0 = p1 - pm1;
    
    direction_1 = p2 - p0;
    
    
    color([.8 + .2*sin(4*360*I),
    .5 + .5*cos(4*360*I),
    .5 + .5*sin(7*360*I)*cos(9*360*I),
    .5])
    //direct, translate, and combine the objects
    //to make a chained hull
    hull(){
        translate(p0)
        point_to(direction_0)
        cylinder(r=0.5 + 0.2*sin(12*360*I), h=0.01, center=true, $fn=30);
        
        translate(p1)
        point_to(direction_1)
        cylinder(r=0.5 + 0.2*sin(12*360*I2), h=0.01, center=true, $fn=30);
    }
    
    }    
    



}












