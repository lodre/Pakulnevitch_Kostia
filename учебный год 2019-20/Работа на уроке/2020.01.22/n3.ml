let n = 80;;    
let rec map f n x = if n>0 then (f (n,x+1)) + (map f (n-x) x)
                           else if n = 0 then 1
                                         else 0;;
let rec count_partition n x = if x<=n then if n > 0 then map (fun (y,z) -> count_partition y z) n x
                                                    else if n = 0 then 1
                                                                  else 0
                                      else 0;;
print_int (count_partition n 1);;   