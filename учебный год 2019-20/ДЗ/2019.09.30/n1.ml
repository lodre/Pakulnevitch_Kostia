let n = "4";; (* 1 - crime and punishment; 2 - The folk book of Faust; 3 - Anna Karenina; 4 - forsythe saga *)
let f = open_in ("n"^n^".txt");;
let rec words s i = if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then ""
                                                                            else (String.make 1 (s.[i]))^(words s (i+1)))
                                           else "";;
let rec next1 s i= if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then next1 s (i+1)
                                                                            else i)
                                           else i;;
let rec next s i = if i < String.length s then (if (s.[i]=' '||s.[i]='\n') then next1 s (i+1)
                                                                           else next s (i+1))
                                          else i;;
let rec words_list s i = if i < String.length s then (words s i)::(words_list s (next s i))
                                                else [];;    
let max_string s l = if String.length s > String.length l then s
                                                          else l;;
let rec map l f x = match l with a::b->map b f (f x a)
                                |[]->x;;


let rec read1 s = try
                      let y = input_line f in let x = map (words_list y 0) max_string "" in
                      read1 (max_string s x)
                  with end_of_file->s;;
print_string (read1 "");;                                             