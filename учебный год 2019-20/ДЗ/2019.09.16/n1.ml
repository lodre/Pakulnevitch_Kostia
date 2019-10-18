let n = 999;;
let rec first x = if x > 9 then first (x / 10)
                           else x;;
let rec sum x i = if i > 0 then sum (x + (first i)) (i - 1)
                           else x;;
let mo = (float (sum 0 n)) /. (float n);;
print_float mo;;