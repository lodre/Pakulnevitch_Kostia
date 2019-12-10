let l = [0;1;1;0;1;1];;
let n = 2;;
let rec f a n i = a * (int_of_float ((float n) ** (float i)));;
let rec convert l n s i = match l with a::b->convert b n (s + (f a n i)) (i+1)
                                      |[]->s;;
print_int (convert l n 0 0);;