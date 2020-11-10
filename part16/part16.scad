/*
cube([20, 1,1] ,center  = true);
cube([1, 20,1] ,center  = true);
cube([1, 1,20] ,center  = true);
*/
/*
//v is a 3d vector
//v has 3 inputs
module ortho(v){
    v0 = v[0];
    v1 = v[1];
    v2 = v[2];
    cube([v0, v1, v2] ,center  = true);
    cube([v1, v0,v2] ,center  = true);
    cube([v1, v2,v0] ,center  = true);
    }
    
    
for(i = [-5 : 5]){
    translate([30*i,0,0])
    ortho([20, 1, 1]);  
}
*/
/*
module s(times, input2){
    translate([input2, input2, input2])
    scale([times,times,1/times])
    intersection(){
    children(0);
        children(1);
    }
    }
 
    
 //   rotate([1,2,3]){
 //       cube();
 //       sphere();
 //   }
    
s(.5, 10){
    sphere(d = 12, $fn = 100);
cube(size = 10, center =  true);

}

*/

module move(spacing=15, height=18){
    translate([0,0,height])
    cylinder(h=20, r1 = 3, r2 = 0, $fn = 100, center =  false);
    for(i = [0:$children - 1]){
            translate([i*spacing,0,0])
            children(i);
        }
    }

move(height=0, spacing=10){
cube(size = 5, center =  true);
sphere(d = 6, $fn = 100);
cylinder(h = 15, center =  true, $fn = 100, d=2);
}

    






    
    
    
    
    
