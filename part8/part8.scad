/*
for(i = [0:10]){
    echo(i);
    translate([i*20,0,0])
    cube(size = i, center = true);
    }
    */
 
/* 
    //ice cream cone
    rotate([180,0,0])
    cylinder(r1 = 10,r2 = 0,  center = false, $fn = 100, h = 70);
    
    //scoops
    scoops = 30;
    
    for(n = [0:scoops - 1]){
        translate([0,0,n*15])
        sphere(r = 11, $fn = 100);
        }
        
 */
 
 var = 10;
 
 for(q = [0:var-1]){
     rotate([0,0,360/var*q])
     translate([50,0,0])
     cube(size = 5, center =  true);
     }
    
    
    
    
    
    
