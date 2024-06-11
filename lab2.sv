module lab2 ( output logic x, y,
    input logic a,b,c
    
) ;
logic q,p,m,e,f;
always_comb begin
q = (a||b);
p = ~c ;
x = (p^q);
m = ~(a&b);
e = (a|b);
f = (m^e);
y = (q&f);
end  
endmodule
