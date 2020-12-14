let p = " * ";;
let t = "***";;
let s = "   ";;

let sa = p^t^s;;    
let sb = t^p^p^p^s;;
let sc = t^p^t^p^s;;
let sd = t^p^p^s;;
let se = p^s;;
let sf = p^p^t^p^s;;
let sg = t^t^p^s;;
let sh = p^p^p^p^s;;
let si = p^p^s;;
let sj = p^t^t^t^s;;
let sk = t^p^t^s;;
let sl = p^t^p^p^s;;
let sm = t^t^s;;
let sn = t^p^s;;
let so = t^t^t^s;;
let sp = p^t^t^p^s;;
let sq = t^t^p^t^s;;
let sr = p^t^p^s;;
let ss = p^p^p^s;;
let st = t^s;;
let su = p^p^t^s;;
let sv = p^p^p^t^s;;
let sw = p^t^t^s;;
let sx = t^p^p^t^s;;
let sy = t^p^t^t^s;;
let sz = t^t^p^p^s;;                               
                                 
          
                                           
let rec morz str = if str = sa then "a" else
if str = sb then "b" else
if str = sc then "c" else
if str = sd then "d" else
if str = se then "e" else
if str = sf then "f" else
if str = sg then "g" else
if str = sh then "h" else
if str = si then "i" else
if str = sj then "j" else
if str = sk then "k" else
if str = sl then "l" else
if str = sm then "m" else
if str = sn then "n" else
if str = so then "o" else
if str = sp then "p" else
if str = sq then "q" else
if str = sr then "r" else
if str = ss then "s" else
if str = st then "t" else
if str = su then "u" else
if str = sv then "v" else
if str = sw then "w" else
if str = sx then "x" else
if str = sy then "y" else
if str = sz then "z" else "";;
                  
let rec parse str1 str2 i = if i<(String.length str1) - 2 then (let st = String.sub str1 i 3 in if st = s then (str2^st,i+3) 
                                                                                                          else parse str1 (str2^st) (i+3))
                                                          else ("",i+3);;

let rec morz_to_str s i = if i<String.length s then (let x = parse s "" i in (morz (fst x))^(morz_to_str s (snd x)))
                                               else "";;

let morz = p^p^p^p^s^p^s^p^t^p^p^s^p^t^p^p^s^t^t^t^s;;

let str = morz_to_str morz 0;;

print_string str;;