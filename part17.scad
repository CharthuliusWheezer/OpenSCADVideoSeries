c = 2;
d = 6;
a = c*5+d*3;

function add(p1, p2) = p1*5 + p2*3;

echo(a);
echo(add(c, d));

function distance(v1, v2) = sqrt(
pow(v2[0] - v1[0], 2) +
pow(v2[1] - v1[1], 2) + 
pow(v2[2] - v1[2], 2));

point1 = [3,0,0];
point2 = [0,5,0];

echo(distance(point1, point2));






