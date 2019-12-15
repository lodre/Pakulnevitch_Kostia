let a = [| [|0;0;0|];
           [|1;0;1|];
           [|0;0;0|] |];;                        
let visited = Array.make (Array.length a) false;;
let ts = Array.make (Array.length a) (-1);;
let rec f1 a i j = try 
                      if visited.(i) then f1 a (i+1) j
                                     else if a.(i).(j) = 0 then f1 a (i+1) j
                                                           else 1 + (f1 a (i+1) j)
                   with _->0;;
let rec f2 a j = if j < Array.length a then (if visited.(j) then (f2 a (j+1))
                                                            else ((f1 a 0 j),j)::(f2 a (j+1)))
                                       else [];;

let rec topsort1 i j = if j<Array.length a then if ts.(j) = -1 then ts.(j)<-i
                                                               else topsort1 i (j+1)
                                           else ();;
let rec topsort2 l = match l with (a1,a2)::b-> if a1=0 then (visited.(a2) <- true; topsort1 a2 0)
                                                       else topsort2 b 
                                 |[]->();;
let rec topsort3 i = if i<Array.length a then (if ts.(i)= -1 then false
                                                             else topsort3 (i+1))
                                         else true;;
let rec topsort4 () = if topsort3 0 then ()
                                    else (topsort2 (f2 a 0);topsort4 ());;
let rec print a =
let rec print1 a i =try let x = a.(i) in
                       (print_string ";";print_int x; print1 a (i+1))
                    with _-> () in 
try
  let x = a.(0) in (print_string "[|"; print_int x; print1 a 1;print_string "|]")
with _-> ();;   

topsort4 ();;
   
print ts;;