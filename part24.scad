

function x(s, t) = s*s;

function y(s, t) = t*s;

function z(s, t) = (s*s*t + t*t*s)/2;

//point
function p(s, t) = [x(s, t), y(s, t), z(s, t)];


function thickness(s, t, stp1, stp2) =
let(
right = p(s + stp1, t),
left = p(s - stp1, t),
up = p(s, t + stp2),
down = p(s, t - stp2),
vec_right = right - left,
vec_up = up - down,
normal = cross(vec_up, vec_right),
unit_norm = normal / norm(normal)
)
unit_norm;



step1 = 0.05;
step2 = 0.05;

for(i = [-1:step1:1], j = [-1:step2:1]){
	S = 10 * i;
	S2 = 10 * (i + step1);

	T = 10 * j;
	T2 = 10 * (j + step2);

	//wall thickness
	length = 5;

	cube_size = 0.01;

	color([abs(S)/10, abs(T)/10, abs(S+T)/20, 1]){
	//triangle 1
	hull(){
		//main point
		translate(p(S, T))
		cube(size=cube_size, 
		center=true);

		//point 2
		translate(p(S, T2))
		cube(size=cube_size, 
		center=true);

		//point1
		translate(p(S2, T))
		cube(size=cube_size, 
		center=true);


		//level2 trainangle 1

		translate(p(S, T) + length * thickness(S, T, step1, step2))
		cube(size=cube_size, 
		center=true);

		translate(p(S2, T) + length * thickness(S2, T, step1, step2))
		cube(size=cube_size, 
		center=true);

		translate(p(S, T2) + length * thickness(S, T2, step1, step2))
		cube(size=cube_size, 
		center=true);
	}

	//triangle 2
	hull(){
		//main point
		translate(p(S2, T2))
		cube(size=cube_size, 
		center=true);

		//point 2
		translate(p(S, T2))
		cube(size=cube_size, 
		center=true);

		//point1
		translate(p(S2, T))
		cube(size=cube_size, 
		center=true);


		//level2 trainangle 2

		translate(p(S2, T2) + length * thickness(S2, T2, step1, step2))
		cube(size=cube_size, 
		center=true);

		translate(p(S2, T) + length * thickness(S2, T, step1, step2))
		cube(size=cube_size, 
		center=true);

		translate(p(S, T2) + length * thickness(S, T2, step1, step2))
		cube(size=cube_size, 
		center=true);
	}


}

	
	

}





