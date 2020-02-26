let a = [|[|1;0;1;0;1;0;1;0;1;0|];
          [|0;1;0;1;0;1;0;1;0;1|];
          [|1;0;1;0;1;0;1;0;1;0|];
          [|0;1;0;1;0;1;0;1;0;1|];
          [|1;0;1;0;1;0;1;0;1;0|];
          [|0;1;0;1;0;1;0;1;0;1|];
          [|1;0;1;0;1;0;1;0;1;0|];
          [|0;1;0;1;0;1;0;1;0;1|];
          [|1;0;1;0;1;0;1;0;1;0|];
          [|0;1;0;1;0;1;0;1;0;1|];
          |];;        


let a = [|[|1;1;1;1;1;1;1;1|];
          [|0;0;0;0;0;1;0;0|];
          [|0;0;0;1;0;0;0;0|];
          [|0;0;1;0;0;0;0;0|]|];;

type t = None 
       | R 
       | U;;

let rec maxi (x1,l1) (x2,l2) = if x1>x2 then (x1,l1)
                                        else (x2,l2);;

let rec sumi x1 (x2,l2) = (x1+x2,l2);;                             

let y0 = Array.length a;;
let x0 = Array.length (a.(0));; 
                        


let rec func x y i l = if (x<x0 && y>=0) then maxi (func (x+1) y (max i (a.(y).(x))) (l@[R])) (if (x<x0-1 && y>0) then sumi (max i (a.(y).(x))) (func (x+2) (y-1) (a.(y-1).(x+1)) (l@(U::R::[])))
                                                                                                                  else (-1,l))
                                         else (i,l);; 

let b = Array.init y0 (fun _ -> Array.make x0 None);; 
                                                         
let rec f x y l = match l with R::d -> (b.(y).(x)<-R; f (x+1) y d)
                              |U::d -> (b.(y).(x)<-U; f (x+1) (y-1) d)
                              |_->();;

let z = (func 0 (y0-1) 0 []);;

f 0 (y0-1) (snd z);;
                                                                   
let rec print_array ar = 
for i = 0 to y0 - 1 do
(print_string (String.make (x0*2+1) '—'); print_string "\n";( 
   for j = 0 to x0 - 1 do
      (print_string "|";
       match b.(i).(j) with
      |None -> print_string " "
      |_    ->print_string (if a.(i).(j) = 1 then "*" else "+")) 
   done);print_string "|\n")
done;
print_string (String.make (x0*2+1) '—') 
;;
let rec print_array2 ar = 
for i = 0 to y0 - 1 do
(print_string (String.make (x0*2+1) '—'); print_string "\n";( 
   for j = 0 to x0 - 1 do
      (print_string "|";
       match a.(i).(j) with
      |1    -> print_string "1"
      |0    -> print_string " "
      |_    -> print_string "*")
   done);print_string "|\n")
done;
print_string (String.make (x0*2+1) '—') 
;;
print_array2 a;;                              
print_string "\n";;
print_array b;;
print_string "\n";;
print_int (fst z);;
