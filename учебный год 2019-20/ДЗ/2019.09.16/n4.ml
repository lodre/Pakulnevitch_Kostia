let n = 10;;
let f n = int_of_float (2.**(float (2*n)));;
let m = float (f n);;
let rec check n x m = if n>0 then (if n mod 2 = 1 then (if x>0 then check (n/2) (x-1) m
                                                               else ((log (float (m/n)))/.(log 2.)))
                                                  else check (n/2) (x+1) m)
                             else (log (float m))/.(log 2.);;
let check2 n = (check n 0 n) +. 1.;;
let rec sum f n x = if n>0 then (sum f (n-1) (x +. (f n)))
                           else m;;
let s n = sum check2 (f n) 0.;;
let mo n = ((s n) /. m);;
print_float (mo n);;
