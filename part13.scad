/*
scale([6,2])
%circle(d = 1, $fn = 100);

cube([6, .5 , .5], center =  true);
cube([.5 , 2 , .5], center =  true);
*/

for(i = [0:10-1]){
rotate([0,0,i*360/10])
translate([8,0])
rotate([0,0,45])
square(size = 5, center  = true);
}