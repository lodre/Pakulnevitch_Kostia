let rec sum x=if x > 0 then (x mod 10) + sum (x/10)
                       else 0;;
let rec f i = if i<1000 then ((float (sum i))/.900.) +. f (i+1)
                       else 0.;;

let x = f 100;;
print_float x;;