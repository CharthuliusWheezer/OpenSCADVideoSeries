module shape(v1=10, v2=5){
	difference(){
		sphere(d = v1, $fn = 100);
		cylinder(d = v2, $fn = 100, h = v1+1, center=true);
	}
}
a = 1;
shape();