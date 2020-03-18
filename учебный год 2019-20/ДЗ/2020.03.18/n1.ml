let rec print_church n = print_int (n ((+) 1) 0);;
let rec n f x = f (f x);;
print_church n;;