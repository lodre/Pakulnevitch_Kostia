let n = 7;;
let rec map f n = if n>=0 then (f n) + (map f (n-1)) else 0;;
let rec step n = if n>0 then map (fun x -> (step x)*(step (n-x-1))) (n-1)
                        else 1;;
print_int (step n);;