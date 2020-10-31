a = 4;
b = 10;

c = a*6 + b*4;
echo(c);

function add(par1, par2) = 
	par1*6 + par2*4;
	
d = add(a, b);

echo(d);

function distance(p1, p2) =
sqrt(
pow(p2[0]-p1[0], 2) +
pow(p2[1]-p1[1], 2) +
pow(p2[2]-p1[2], 2));

v1 = [3, 0, 0];
v2 = [10, 0, 0];

echo(distance(v1, v2));

function f1(x) = 6*sin(x)-7*cos(x) + x*x/10000;
function f2(x) = 10*sin(x) + x/20;

function combine(x) = 
[x/20, f1(x), f2(x)];

for(i = [-360:2:360]){
	translate(combine(i))
	cube(size = 2, center =  true);
	}



