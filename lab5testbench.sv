module Lab4_tb;
    reg a0, a1, b0, b1;
    wire RED, GREEN, BLUE;
    Lab4 dut (
        .a0(a0),
        .a1(a1),
        .b0(b0),
        .b1(b1),
        .R(RED),
        .G(GREEN),
        .B(BLUE)
    );
    initial begin
        $monitor("Time=%0t, a0=%b, a1=%b, b0=%b, b1=%b, R=%b, G=%b, B=%b", $time, a0, a1, b0, b1, R, G, B);
        a0 = 0; a1 = 0; b0 = 0; b1 = 0; #10; 
        a0 = 0; a1 = 0; b0 = 0; b1 = 1; #10; 
        a0 = 0; a1 = 0; b0 = 1; b1 = 0; #10; 
        a0 = 0; a1 = 0; b0 = 1; b1 = 1; #10; 
        a0 = 0; a1 = 1; b0 = 0; b1 = 0; #10; 
        a0 = 0; a1 = 1; b0 = 0; b1 = 1; #10;
        a0 = 0; a1 = 1; b0 = 1; b1 = 0; #10; 
        a0 = 0; a1 = 1; b0 = 1; b1 = 1; #10; 
        a0 = 1; a1 = 0; b0 = 0; b1 = 0; #10; 
        a0 = 1; a1 = 0; b0 = 0; b1 = 1; #10;
        a0 = 1; a1 = 0; b0 = 1; b1 = 0; #10;
        a0 = 1; a1 = 0; b0 = 1; b1 = 1; #10;
        a0 = 1; a1 = 1; b0 = 0; b1 = 0; #10; 
        a0 = 1; a1 = 1; b0 = 0; b1 = 1; #10; 
        a0 = 1; a1 = 1; b0 = 1; b1 = 0; #10; 
        a0 = 1; a1 = 1; b0 = 1; b1 = 1; #10; 
        $stop;
    end
endmodule

