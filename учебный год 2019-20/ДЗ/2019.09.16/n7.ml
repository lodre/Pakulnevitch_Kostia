let n = 1012;;
let rec max1 n x =if n>0 then (max1 (n/10) (max x (n mod 10)))
                         else x;;          
let max2 n = max1 n 0;;
let rec sum f n x = if n>0 then (sum f (n-1) (x + (f n)))
                           else x;;                
let test x = if max2 x < 2 then 1
                           else 0;;
let s n = sum test n 0;;
let mo n = (float (s n))/.(float n);;
print_float (mo n);;