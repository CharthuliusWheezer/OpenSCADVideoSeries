my_list = [1, 2, 3, 4, 5, true, false, "hello"];
echo(my_list);

second = [5, 4, 20, 10];

echo(len(second));
echo(second[3]);
/*
test_list = [4, 5, 6];

translate(test_list)
cube(size = 2, center =  true);
*/

vectors = [
[1, 2, 3],
[5, 4, 3],
[8, 9, 13]
];
/*
for(v=vectors){
        translate(v)
        cube(size = 2, center =  true);
    }
    */  
for(c=[0:len(vectors) - 1]){
        translate(vectors[c])
        cube(size = 2, center =  true);
    }
    
    
    
    
    
    







