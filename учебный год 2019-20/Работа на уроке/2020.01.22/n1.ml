let n = 10;;    
let rec map f n = if n>0 then (f n) + (map f (n-1))
                         else 1;;
let rec count_partition n = if n > 0 then map (fun x -> count_partition x) (n-1)
                                     else 1;;
print_int (count_partition n);;