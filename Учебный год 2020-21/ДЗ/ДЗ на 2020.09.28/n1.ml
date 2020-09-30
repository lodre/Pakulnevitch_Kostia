let m = 1;;
let n = 1000;;

let rec map x y = if x>y then (if x mod y = 0 then false
                                              else map x (y+1))
                         else true;;

let rec pr x = if map x 2 then 1 else 0;; 

let rec p n m s = if n>m then p (n-1) m (s+(pr n))
                         else s;;

let x = (float (p n m 0))/.(float (n-m+1));;
print_float x;;