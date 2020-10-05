let str = "abcd";;

let p = " * ";;
let t = "***";;
let s = "   ";;

let rec morz ch = match ch with 'a'|'A' ->p^t^s
                               |'b'|'B' ->t^p^p^p^s
                               |'c'|'C' ->t^p^t^p^s
                               |'d'|'D' ->t^p^p^s
                               |'e'|'E' ->p^s
                               |'f'|'F' ->p^p^t^p^s
                               |'g'|'G' ->t^t^p^s
                               |'h'|'H' ->p^p^p^p^s
                               |'i'|'I' ->p^p^s
                               |'j'|'J' ->p^t^t^t^s
                               |'k'|'K' ->t^p^t^s
                               |'l'|'L' ->p^t^p^p^s
                               |'m'|'M' ->t^t^s
                               |'n'|'N' ->t^p^s
                               |'o'|'O' ->t^t^t^s
                               |'p'|'P' ->p^t^t^p^s
                               |'q'|'Q' ->t^t^p^t^s
                               |'r'|'R' ->p^t^p^s
                               |'s'|'S' ->p^p^p^s
                               |'t'|'T' ->t^s
                               |'u'|'U' ->p^p^t^s
                               |'v'|'V' ->p^p^p^t^s
                               |'w'|'W' ->p^t^t^s
                               |'x'|'X' ->t^p^p^t^s
                               |'y'|'Y' ->t^p^t^t^s
                               |'z'|'Z' ->t^t^p^p^s
                               |_-> "";;

let rec str_to_morz s i = if i<String.length s then (morz s.[i])^(str_to_morz s (i+1))
                                               else "";;

let m = str_to_morz str 0;;

print_string m;;