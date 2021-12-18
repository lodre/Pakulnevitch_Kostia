let ch s c = let rec cha s c i =if i<String.length s then (if s.[i]=c then 1 
                                                                      else 0)+(cha s c (i+1)) 
                                                     else 0 in
            ((cha s c 0), c);;
let rec find l x = match l with a::b-> if x=a then true else find b x|[]->false;;
let rec list_count s i = if i<String.length s then (ch s s.[i])::(list_count s (i+1))
                                              else [];;
let rec del l = match l with a::b->if find b a then del b else a::(del b)|[]->[];;
let rec slc s = del (list_count s 0);; (* sort list of count *)
let s = "abcdef";;
let l = slc s;;

let vowels = ['a';'e';'y';'i';'o';'u'];;

let rec probability x = (float x)/.(float (String.length s))
let rec prob_list l = match l with (x,y)::b->((probability x),y)::(prob_list b)
                                  |[]->[];;
let l = prob_list l;;
let rec mo l = match l with (x,y)::b->if (find vowels y) then x+.(mo b)
                                                         else (mo b)
                           |[]->0.;;
print_float (mo l);;