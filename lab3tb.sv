`timescale 1ns/1ps

module lab3_tb();
logic a1;
logic b1;
logic c1;
logic y1;
logic x1;
localparam period=10;
lab3 tb(.a(a1),.b(b1),.c(c1),.y(y1),.x(x1));
initial begin
  a1 = 0 ; b1 = 0 ; c1 = 0 ;
  #period;
  a1=0;b1=0;c1=1;
  #period;
  a1=0;b1=1;c1=0;
  #period;
  a1=0;b1=1;c1=1;
  #period;
  a1=1;b1=0;c1=0;
  #period;
  a1=1;b1=0;c1=1;
  #period;
  a1=1;b1=1;c1=0;
  #period;
  a1=1;b1=1;c1=1;
  #period;
 
end
initial
begin
 $monitor("y=%b, a=%b, b=%b, c=%b ,x= %b",y1,a1,b1,c1,x1);
end
endmodule
