let s ="aebae";;
let m = [|0.|];;
let rec find l x = match l with a::b-> if x=a then true else find b x|[]->false;;

let vowels = ['a';'e';'y';'i';'o';'u'];;

for i = 1 to (String.length s) - 1 do
    m.(0)<-(if ((find vowels s.[i-1])&&(find vowels s.[i])) then m.(0) +. 1.
                                                            else m.(0))
done;;

print_float (m.(0)/.(float (String.length s - 1)));;