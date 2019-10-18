let rec sum x=if x > 0 then (x mod 10) + sum (x/10)
                       else 0;;
let rec f i = if i<100 then ((float (sum i))/.90.) +. f (i+1)
                       else 0.;;

let x = f 10;;
print_float x;;