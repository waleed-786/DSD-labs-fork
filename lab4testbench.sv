`timescale 1ns/10ps
module lab4testbench();
logic [1:0] a1;
logic  [1:0] b1;
logic  green ;
logic  blue ;
logic  red ;
localparam period=10;
lab4 abc(.a(a1),
.b(b1),

.green(green),.red(red), .blue(blue) );
initial begin
  a1[1] = 0;a1[0] = 0; b1[1] = 0; b1[0] = 0;
  #10;
  a1[1] = 0;a1[0] = 0; b1[1] = 0; b1[0] = 1;
  #10;
  a1[1] = 0;a1[0] = 0; b1[1] = 1; b1[0] = 0;
  #10;
  a1[1] = 0;a1[0] = 0; b1[1] = 1; b1[0] = 1;
  #10;
  a1[1] = 0;a1[0] = 1; b1[1] = 0; b1[0] = 0;
  #10;
  a1[1] = 0;a1[0] = 1; b1[1] = 0; b1[0] = 1;
  #10;
  a1[1] = 0;a1[0] = 1; b1[1] = 1; b1[0] = 0;
  #10;
  a1[1] = 0;a1[0] = 1; b1[1] = 1; b1[0] = 1;
  #10;
  a1[1] = 1;a1[0] = 0; b1[1] = 0; b1[0] = 0;
  #10;
  a1[1] = 1;a1[0] = 0; b1[1] = 0; b1[0] = 1;
  #10;
  a1[1] = 1;a1[0] = 0; b1[1] = 1; b1[0] = 0; 
  #10;
  a1[1] = 1;a1[0] = 0; b1[1] = 1; b1[0] = 1;
  #10;
  a1[1] = 1;a1[0] = 1; b1[1] = 0; b1[0] = 0;
  #10;
  a1[1] = 1;a1[0] = 1; b1[1] = 0; b1[0] = 1;
  #10;
  a1[1] = 1;a1[0] = 1; b1[1] = 1; b1[0] = 0;
  #10;
  a1[1] = 1;a1[0] = 1; b1[1] = 1; b1[0] = 1;
  #10;

  $stop;

        
end
 
 

initial
begin
 $monitor("a1[1]=%b, a1[0]=%b, b1[1]=%b, b1[0]=%b ,red= %b , green = %b, blue= %b",a1[1],a1[0],b1[1],b1[0],green, red, blue);
end
endmodule
