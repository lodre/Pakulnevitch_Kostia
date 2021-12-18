let n = 8;;
let rec find x l = match l with a::b-> if a = x then true
                                                else find x b
                               |[]->false;;
let a = Array.make n (Array.make n 0);;
let rec check a x y = if (x<0)||(x>n-1)||(y<0)||(y>n-1) then false
                                                        else if a.(x).(y) = 1 then false
                                                                              else true;;
exception T;;
let rec find_solution placed (x,y) = 
   let rec cp x y a = 
      (let b = Array.copy a in 
          (if check b x y then (b.(x).(y)<-1; find_solution b (x,y)) else false)) in
if placed = Array.make n (Array.make n 1) then true else ( 
if cp (x+1) (y+2) placed then true else 
if cp (x+2) (y+1) placed then true else
if cp (x-1) (y+2) placed then true else
if cp (x-2) (y+1) placed then true else
if cp (x+1) (y-2) placed then true else
if cp (x+2) (y-1) placed then true else
if cp (x-1) (y-2) placed then true else
if cp (x-2) (y-1) placed then true else false);;                                                                            
a.(0).(0)<-1;;
try (let x = find_solution a (0,0) in print_string "false") with T -> print_string "true";;   