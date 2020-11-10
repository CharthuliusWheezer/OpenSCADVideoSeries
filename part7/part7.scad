//echo(5+10-3);
/*
%cube([20,3,10], center =  true);
cube(size = 8, center =  true);
*/

var = 0;
next = var+3;
other = "this is a string";
bool = true;

echo(var / next);
echo(other);

rotate([0,0,var*3]){
translate([var,0,next])
cube(size = 5, center  = bool);


translate([-var,0,-next])
cube(size = 5, center  = bool);
}


