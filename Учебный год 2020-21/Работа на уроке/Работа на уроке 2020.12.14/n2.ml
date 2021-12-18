let s1 = read_line();;
let read s =
let rec read1 s x i = if i=String.length s then (x,i+1)
                                           else if s.[i] = ' ' then (x,i+1)
                                                               else read1 s ((10*x)+(int_of_string (String.make 1 s.[i]))) (i+1) in
let (n,j) = read1 s 0 0 in
let m = fst (read1 s 0 j) in (n,m);;
let (n,m) = read s1;;  
let s = read_line();;
let rec inp a i = if i<m then (a.(i)<-(read_int());inp a (i+1))
                         else ();;
let a = Array.make m 0;;
inp a 0;;
let rec check k p i = 
if p = k then true
         else if i = String.length s then false
                       else if s.[i] = '0' then check k 0 (i+1)
                                           else check k (p+1) (i+1);;        

for i=0 to m-1 do
print_string (if check (a.(i)) 0 0 then "NO\n" else "YES\n")
done;;