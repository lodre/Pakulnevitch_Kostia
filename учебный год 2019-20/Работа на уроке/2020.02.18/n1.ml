let a = [|[|0;0;0;0;0;0;0;0;0;1|];
          [|0;0;0;0;0;0;0;1;0;0|];
          [|0;0;0;0;0;1;0;0;0;0|];
          [|0;0;0;1;0;0;0;0;0;0|];
          |];;

let y0 = Array.length a;;
let x0 = Array.length (a.(0));; 


let rec func x y i = if (x<x0 && y<y0) then max (func (x+1) y (max i (a.(y).(x)))) (max i (a.(y).(x)) + (func (x+2) (y+1) (try a.(y+1).(x+1) with _ -> 0)))
                                       else i;; 
print_int (func 0 0 0);;
