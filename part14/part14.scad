/*
rotate_extrude($fn = 300)
translate([30,0,0]){
scale([1,2])
circle(d = 10, $fn = 100);
translate([7,0,0])
circle(d = 5 , $fn = 100);
}
*/

/*
linear_extrude(
height=30, 
center =  true,
scale = [1, 1], 
twist = 180, 
slices = 200
)
square([20, 5], center =  true);

*/

linear_extrude(
height = 100, 
center =  true, 
scale = 1 , 
twist = 1080*sin(360*$t), 
slices = 100)
scale([3, 1])
circle(d = 10, $fn = 50);



linear_extrude(
height = 100, 
center =  true, 
scale = 1 , 
twist = -1080*sin(360*$t), 
slices = 100)
scale([3, 1])
circle(d = 10, $fn = 50);
