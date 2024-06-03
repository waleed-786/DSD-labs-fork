`timescale 10ns/1ps
module lab4_t1_testbench; 
  logic red;
  logic green;
  logic blue;
  logic [1:0] a;
  logic [1:0] b;
  localparam period = 10;

  lab4_t1 dut (
    .a(a),
    .b(b),
    .red(red), 
    .green(green),
    .blue(blue)
  );

  initial begin
    
    a[1] = 0; a[0] = 0; b[1] = 0; b[0] = 0;
    #period;
    a[1] = 0; a[0] = 0; b[1] = 0; b[0] = 1;
    #period;
    a[1] = 0; a[0] = 0; b[1] = 1; b[0] = 0;
    #period;
    a[1] = 0; a[0] = 0; b[1] = 1; b[0] = 1;
    #period;
    a[1] = 0; a[0] = 1; b[1] = 0; b[0] = 0;
    #period;
    a[1] = 0; a[0] = 1; b[1] = 0; b[0] = 1;
    #period;
    a[1] = 0; a[0] = 1; b[1] = 1; b[0] = 0;
    #period;
    a[1] = 0; a[0] = 1; b[1] = 1; b[0] = 1;
    #period;
    a[1] = 1; a[0] = 0; b[1] = 0; b[0] = 0;
    #period;
    a[1] = 1; a[0] = 0; b[1] = 0; b[0] = 1;
    #period;
    a[1] = 1; a[0] = 0; b[1] = 1; b[0] = 0;
    #period;
    a[1] = 1; a[0] = 0; b[1] = 1; b[0] = 1;
    #period;
    a[1] = 1; a[0] = 1; b[1] = 0; b[0] = 0;
    #period;
    a[1] = 1; a[0] = 1; b[1] = 0; b[0] = 1;
    #period;
    a[1] = 1; a[0] = 1; b[1] = 1; b[0] = 0;
    #period;
    a[1] = 1; a[0] = 1; b[1] = 1; b[0] = 1;
    #period;
    $stop;
  end

  initial begin
    
    $monitor("a[1]=%b , a[2]=%b , b[1]=%b , b[2]=%b , red=%b , green=%b , blue=%b", a[0], a[1], b[0], b[1], red, green, blue);
  end
endmodule