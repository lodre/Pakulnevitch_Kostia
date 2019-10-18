let f1 = open_in (Sys.argv.(1));;
let f2 = open_out (Sys.argv.(2));;
let rec copy f1 f2 = try
                        let x = input_byte f1 in (output_byte f2 x;copy f1 f2)
                     with _ -> ();;
copy f1 f2;;