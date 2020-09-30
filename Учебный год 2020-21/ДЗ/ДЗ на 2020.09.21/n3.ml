let m = 30;;               

let rec sum n x = if n>0 then sum (n-1) ((float (m-n)/.365.)+.x-.x*.(float (m-n)/.365.))
                         else x;;

let x = (sum m 0.);;

print_float x;;
