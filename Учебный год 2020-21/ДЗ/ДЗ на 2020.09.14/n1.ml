let f = open_in "n1.txt";;
                                                                                       
let rec next1 s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                                else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then next1 s (i+1)
                                                               else next s (i+1))
                                          else i;;
let rec words_count s i = if i < String.length s then 1 + (words_count s (next s i))
                                                 else 0;;      

let g s = words_count s 0;;

let rec read x = (try
                     let s = input_line f in let y = g s in
                     (fun a -> (read (x+y)))
                 with end_of_file->(fun a -> x)) ();;
let x = read 0;;
print_int x;;
