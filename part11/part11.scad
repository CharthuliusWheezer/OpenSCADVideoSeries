/*
rotate([0,0,360*$t])
translate([20,0,0])
cube(size =  10, center =  true);

rotate([0,360*$t,0])
translate([20,0,0])
cube(size =  10, center =  true);

rotate([360*$t,0,0])
translate([20,0,0])
cube(size =  10, center =  true);
*/


for(i=[-360:5:360]){
    translate([i,0,30*sin(i)*sin(360*$t)])
    cube(size = 5, center =  true);
    }


/*
translate([10*sin(360*$t),10*cos(360*$t),0])
cube(size = 10, center =  true);
*/








