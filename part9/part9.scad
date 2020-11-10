/*
for(x=[-5:5]){
    for(y=[-5:5]){
        for(up=[-5:5]){
        translate([2*x,2*y,2*up])
        cube(size = 1, center =  true);
        }
        }
    }
    */
    
 /*
    for(x=[-5:5], y=[-5:5],up=[-10:1:10]){
        translate([2*x,2*y,2*up])
        cube(size = 1, center =  true);
    }
    */
 /*
    difference(){
    union(){
    cube(size=10, center =  true); 
    cylinder(d = 5, center = true, 
        h = 20, $fn=100);
    }
    
    rotate([90,0,0])
    cylinder(d = 5, center = true, 
        h = 20, $fn=100);    
        
    rotate([0,90,0])
    cylinder(d = 5, center = true, 
        h = 20, $fn=100);   
        
    }
    */
  /*  
    rotate([0,0,45])
    translate([10,0,0])
    union(){
    cube(size=10, center =  true);   
    cylinder(d = 5, center = true, 
        h = 20, $fn=100);
    }
    */
    
    difference(){
    intersection(){
    cube(size = 10, center =  true);
    sphere(d = 12, $fn = 100);
    }
    
    cylinder(d = 5, center =  true, $fn = 100, h = 11);
    
    
}
    
    //%cube(size = 10, center =  true);
    //%sphere(d = 12, $fn = 100);


    
    
    
    
    
