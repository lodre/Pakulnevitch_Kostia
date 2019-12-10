let a = [| [|0;1;1|];
           [|0;0;1|];
           [|0;0;0|] |];;
let rec f a i j s = try  (let x = (a.(j).(i)) in
                       f a (i+1) j (x + s))
                    with _-> ( try (let x = a.(j).(0) in
                                  f a 0 (j+1) s)
                               with _->s);;
print_int (f a 0 0 0);;