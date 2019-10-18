let f = open_out "n6.UTF8";;     
for i = 224 to 255 do 
    output_byte f i
done;;
   
for i = 192 to 223 do 
    output_byte f i
done;;

