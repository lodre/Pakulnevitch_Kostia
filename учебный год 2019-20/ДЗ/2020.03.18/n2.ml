let x = 10
let rec print_church n = print_int (n ((+) 1) 0);;
let rec n f x = f (f x);;
let rec inc n = fun f x -> f (n f x);;
let rec incx n i = if i>0 then incx (inc n) (i-1)
                          else n;;

let n = incx (fun f x -> x) x;;

print_church n;;