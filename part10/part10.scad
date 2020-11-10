/*
for(i=[0:100]){
    if(i%2==0){
        translate([2*i,0,0])
        cube(size = 1, center =  true);
        }
    else if(i%9 == 0){
        translate([2*i,5,0])
        cube([2,3,15], center =  true);
        }
        else{
               translate([2*i,5,0])
               cube(size = 1, center =  true);
            }
    }
    */
    
/* 
scale([1,3,2])    
//sphere(d = 10, $fn = 200);
rotate([0,45,0])
rotate([45,0,0])
cube(size = 10 , center =  true);
*/
/*
for(x = [-5:.2:5+0.2]){
    echo(x);
    //x squared
    x_squared = x*x;
    //x cubed
    x_cubed = x*x*x;
    translate([x,x_squared,x_cubed])
    cube(size = 1, center =   true);
    }
    */
    
    for(a = [-5:.2:5], b = [-5:.2:5]){
        z = pow(a, 2)+pow(b,2);
            translate([2*a,2*b, z])
        cube(size = 1, center =  true);
        }
    
    
    
    





