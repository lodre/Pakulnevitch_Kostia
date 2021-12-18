let s = read_line ();;
let read s =
let rec read1 s x i = if i=String.length s then (x,i+1)
                                           else if s.[i] = ' ' then (x,i+1)
                                                               else read1 s ((10*x)+(int_of_string (String.make 1 s.[i]))) (i+1) in
let (n,j) = read1 s 0 0 in
let m = fst (read1 s 0 j) in (n,m);;

let (n,m) = read s;;  

let a = Array.make n (Array.make n false);;

let rec rep i = if i<=0 then ()
                       else (let s = read_line () in let (x,y) = read s in (a.(x).(y)<-true;a.(y).(x)<-true; rep (i-1)));;  

rep m;;


let q = read_int ();;

let read
