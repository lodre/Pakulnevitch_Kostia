let f = open_in "n1.txt";;
                    
let rec ends c = (c = '.'||c = '!'||c = '?');;

let cap c = if ((c>='A' && c<='Z')||(c>='À' && c<='ß')) then 1
                                                        else 0;;
                                                                   
let rec next1 s i j = if i < String.length s then (if (s.[i]<'A') then (if ends s.[i] then next1 s (i+1) 1 else next1 s (i+1) j)
                                                                  else (i,j))
                                           else (i,j);;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then (if ends s.[i] then next1 s (i+1) 1 else next1 s (i+1) 0)
                                                               else next s (i+1))
                                          else (i,0);;
let rec words_count s i = if i < String.length s then 1 + (words_count s (fst (next s i)))
                                                 else 0;;      


let rec words_count2 s (i,j) = if i < String.length s then (if j = 0 then (cap s.[i]) else 0) + (words_count2 s (next s i))
                                                      else 0;;      

let g s = (words_count s 0, words_count2 s (0,1));;
                                                       
let rec read (x1,x2) = (try
                     let s = input_line f in let (y1,y2) = g s in
                     (fun a -> (read (x1+y1,x2+y2)))
                 with end_of_file->(fun a -> (x1,x2))) ();;

let (s1,s2) = read (0,0);;
print_float ((float s2)/.(float s1));;
