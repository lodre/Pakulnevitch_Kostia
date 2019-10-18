let l = [(1,[0;0]);(2,[0;1]);(3,[1;0]);(4,[1;1])];;
type prefix =Question of prefix*prefix
            |Answer of int;;
(*None Some ()*)
let rec make_prefix l = match l with