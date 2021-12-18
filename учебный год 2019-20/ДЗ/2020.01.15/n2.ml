let n = 3;;
let rec find x l = match l with a::b-> if a = x then true
                                                else find x b
                               |[]->false;;
let a = Array.make n (Array.make n 0);;
let rec check a x y = if (x<0||x>n-1||y<) then false
                                                        else if a.(x).(y) = 1 then false
                                                                              else true;;
exception T;;
let rec find_solution placed (x,y) =                                                                
if check a y x then
               else ;;