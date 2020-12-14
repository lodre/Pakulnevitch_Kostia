let p = 4294967297;;
let k = 11;;

let hash x =
let rec h s x i = if i<String.length x then h ((s*k+(int_of_char x.[i])) mod p) x (i+1)
                                       else s in
h 0 x 0;;  

print_int (hash "kzmdvioanrglkv sd2e");;