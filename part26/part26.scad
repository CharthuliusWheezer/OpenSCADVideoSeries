
//refference
//https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/List_Comprehensions

//basic list comprehension
function basic(a) = [for(i = [0:a-1]) i*i];
echo("basic list comprehension");
echo(basic(15));
echo("\n");




//list comprehension with let statement

echo("let statment function 1");
function let_statement_1(a) = 
[for(i = [0:a-1]) let(output = 2*i*i - 3*i + 4) output];
echo(let_statement_1(10));
echo("\n");

//double variable assignment
function let_statement_2(a) =
[
    for(i = [0:a-1])
    let(value = i*i*i - 20, second_value = value*2 - 43)
    second_value
];
    

echo("let statment function 2");
echo(let_statement_2(2));
echo("\n");




//"each" statment in a list comprehension
//expanding a range
echo("each statement")
echo([each([-10:2:10])]);
echo("\n");

//concatenating vectors with each
vector_1 = [1, 2, 3, 4, 5];

vector_2 = [22, 33, 44 ,55, 66];

vecs = [each(vector_1), each(vector_2)];

echo("concatenating vectors with each");
echo(vecs);
echo("\n");

//flattening with each

matrix = [[4, 5, 6, 7, 8, 9, 1090],
          [1, 2, 3],
          [0, 6, 2]];

function flatten(vec) = [for(v = vec) each(v)];

echo("flattening vectors with each");
echo(flatten(matrix));
echo("\n");


// list comprehensions with iteration

function iteration(a) =
[for(i = 0; i < a; i = i+1) i];

function iteration_extra(a) =
[for(i = 0, j = 0;
    (i < a && j < a);
    i = i+1, j=2*(j+1))
    each([i, j])];

echo("iterating function");
echo(iteration(50));
echo("\n");




//coditional statments in list comprehensions
//if, if else
function even_numbers(a) =
[for(i = [0:a-1]) if((i%2) == 0) i];
echo("conditional function");
echo(even_numbers(50));
echo("\n");



function filter_numbers(vec, cutoff) =
[
    for(i = [0:len(vec)-1])
    if(vec[i] <= cutoff) vec[i]
    else cutoff];
echo("filter function");
echo(filter_numbers([1,2,3,4,5,6,7,8,7,6,5,4,3,2,1], 7));
echo("\n");



// else if function
function else_if_function(a) =
[for(i = [0:a-1])
    if((i % 5) == 0) i
    else if((i % 2) == 0) -i
    else 100*i];
    
echo("else if conditional function");  
echo(else_if_function(50));
echo("\n");

//outputting vectors from list comprehensions
function vectors(a) =
[
    for(i = [0:a-1])
    [i, i*i, i*i*i]
];
echo("vectors function");
echo(vectors(10));
the_vectors = vectors(10);
//echo(the_vectors);
echo(the_vectors[9]);
echo(the_vectors[9][1]);
echo("\n");


//multiple for loop list comprehension

function multi_loop(a) =
[
    for(i = [0:a-1], j = [0:a-1])
    [i, j]
];

echo("multi loop function");
echo(multi_loop(3));  
echo("\n");


//multi iteration list comprehension
function multi_iteration(a) =
[
    for(i = 0; i < a; i = i+1)
    for(j = 0; j < a; j = j+2)
    [i, j]    
];
    
echo("multi iteration loop function");
echo(multi_iteration(6));  
echo("\n");






// functions in a list comprehension

function my_function(x) = x/2 + 1/(abs(x) + 1);

function f_list_original(a) =
[
    for(i = [-a:a])
    let(output = my_function(i))
    output
];
    
    
function f_list(a) =
[
    for(i = [-a:a])
    my_function(i)
];
echo("function comprehension");
echo(f_list(6));  
echo("\n");



// creating a spiral with a list comprehension

function spiral(height, radius, rotations, steps) =
    
[
    for(i = [0:steps-1])
    let(I = i / (steps-1),
        x = radius * cos(360*I*rotations),
        y = radius * sin(360*I*rotations),
        z = height * I)
    [x, y, z]    
];
    
/*  
for(point = spiral(10, 4, 7, 1000)){
    
    translate(point)
    cube(size=0.1, center=true);
    
    }
*/










//creating trefoil knot with list comprehension
//refference
//https://en.wikipedia.org/wiki/Torus_knot
function X(t, a, b) = (cos(b*t) + 2)*cos(a*t);
    
function Y(t, a, b) = (cos(b*t) + 2)*sin(a*t);
    
function Z(t, a, b) = -sin(b*t);


function knot(p, q, steps) =

[
    for(i = [0:steps-1])
    let(I = 360*i / steps)
    [X(I, p, q), Y(I, p, q), Z(I, p, q)]
];
    
    
for(point = knot(2, 5, 1000)){
    
    translate(point)
    rotate(rands(0, 360, 3, point[0]))
    color(rands(0, 256, 3, point[1])/256)
    cylinder(r1=0.05, r2=0, h=.5, center=false, $fn=20);
    
    }
    
    
 
    











