module lab3 ( output logic x, y,
    input logic a,b,c
    
) ;
logic q,p,m,e,f;
always_comb begin

 assign x = (~c ^ (a || b));
 assign y = ((a || b) & ((~(a & b)) ^ (a | b)));
    
   end


    
endmodule