let n = read_int ();;

let rec f n = if n>9 then (f (n/10))
                     else n;;

let rec sum n x = if n>0 then sum (n-1) ((if (f n = 1) then 1 else 0)+x)
                         else x;;

let x = (float (sum n 0))/.(float n);;

print_float x;;