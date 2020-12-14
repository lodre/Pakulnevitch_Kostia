let f = open_in "n4.txt";;
                    
let rec ends c = c = '.'||c = '!'||c = '?';;

let rec rus s i r f = if i<String.length s then (if ends s.[i] then r>f
                                                               else (if (((s.[i]>='à')&&(s.[i]<='ÿ'))||((s.[i]>='À')&&(s.[i]<='ß'))) then rus s (i+1) (r+1) f
                                                                                                                         else (if (((s.[i]>='a')&&(s.[i]<='z'))||((s.[i]>='A')&&(s.[i]<='Z'))) then rus s (i+1) r (f+1) else rus s (i+1) r f)))
                                           else r>f;;       

let cap c = if ((c>='A' && c<='Z')||(c>='À' && c<='ß')) then 1
                                                        else 0;;
                                                                   
let rec next1 s i j = if i < String.length s then (if (s.[i]<'A') then (if s.[i] = '.' then next1 s (i+1) 1 else next1 s (i+1) j)
                                                                  else (i,j))
                                           else (i,j);;
let rec next s i = if i < String.length s then (if (s.[i]<'A') then (if s.[i] = '.' then next1 s (i+1) 1 else next1 s (i+1) 0)
                                                               else next s (i+1))
                                          else (i,0);;                                                    

let rec words_count s i j1 (j2,k2) (r,f) = if i < String.length s then (if snd (next s i) = 1 then (if r>=f then words_count s (fst (next s i)) 0 (j1+j2+1,k2+1) (0,0) else words_count s (fst (next s i)) 0 (j2,k2) (0,0))
                                                                                              else words_count s (fst (next s i)) (j1+1) (j2,k2) (if rus s i 0 0 then (r+1,f) else (r,f+1)))
                                                                  else (if r>=f then (j1+j2,k2) else (j2,k2));;      

let g s = words_count s 0 0 (0,0) (0,0);;
                                                       
let rec read (x1,x2) = (try
                     let s = input_line f in let (y1,y2) = g s in
                     (fun a -> (read (x1+y1,x2+y2)))
                 with end_of_file->(fun a -> (x1,x2))) ();;

let (s1,s2) = read (0,0);;
print_float ((float s1)/.(float s2));;