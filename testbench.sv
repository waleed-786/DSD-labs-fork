module frequency (

);
    logic clk;
    logic clk2;
    logic reset;
frequency BUT(.clk(clk),
.reset(reset),.clk2(clk2));
initial begin
    reset=0;
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    reset=1;
    #50 reset=0;
end



    


endmodule