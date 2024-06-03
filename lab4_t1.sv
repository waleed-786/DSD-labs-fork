module lab4_t1 (
   
    input logic [1:0] a,
    input logic[1:0] b ,
    output logic red, green, blue
);
always_comb begin 
    red = ((~a[0]) && (~a[1])) || (b[0] && b[1]) || ((~a[0]) && (~b[0]) && b[1]) || ((~a[0]) && a[1] && b[0]) || (a[0] && (~a[1]) && b[0]);
    green = ((~a[1]) && b[1]) || ((~a[0]) && b[0]) || (a[0] && (~b[0])) || (a[1] && (~b[1]));
    blue = (a[0] && a[1]) || ((~b[0]) && (~b[1])) || (a[0] && (~a[1]) && (~b[0])) || (a[1] && (~b[0]) && b[1]) || (a[0] && b[0] && (~b[1]));

end





 endmodule