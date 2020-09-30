let n = 100000;;

let i = 0;; (*оканч на*)

let rec f n = n mod 10;;

let rec sum n x = if n>0 then sum (n-1) ((if (f (n*n) = i) then 1 else 0)+x)
                         else x;;

let x = (float (sum n 0))/.(float n);;

print_float x;;