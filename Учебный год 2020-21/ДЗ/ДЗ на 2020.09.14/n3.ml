let f = open_in "n3.txt";;
                    
let cap c = if ((c>='A' && c<='Z')||(c>='À' && c<='ß')) then 1
                                                        else 0;;
                                                                   
let rec next1 s i j = if i < String.length s then (if (s.[i]<'A') then (if s.[i] = '.' then next1 s (i+1) 1 else next1 s (i+1) j)
                                                                  else (i,j))
                                           else (i,j);;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then (if s.[i] = '.' then next1 s (i+1) 1 else next1 s (i+1) 0)
                                                               else next s (i+1))
                                          else (i,0);;                                                    

let rec words_count s i (j,k) = if i < String.length s then (words_count s (fst (next s i)) (j+1,k+(snd (next s i))))
                                                       else (j,k);;      

let g s = words_count s 0 (0,0);;
                                                       
let rec read (x1,x2) = (try
                     let s = input_line f in let (y1,y2) = g s in
                     (fun a -> (read (x1+y1,x2+y2)))
                 with end_of_file->(fun a -> (x1,x2))) ();;

let (s1,s2) = read (0,0);;
print_float ((float s1)/.(float s2));;
