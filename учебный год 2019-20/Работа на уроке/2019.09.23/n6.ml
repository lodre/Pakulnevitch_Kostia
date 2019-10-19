let f = open_out "n6.UTF8";;     
for i = 0x410 to 0x42f do 
    (output_byte f (192+(i/64));output_byte f (128 + (i mod 64)))
done;;
   
for i = 0x430 to 0x44f do                                        
    (output_byte f (192+(i/64));output_byte f (128 + (i mod 64))) 
done;;

