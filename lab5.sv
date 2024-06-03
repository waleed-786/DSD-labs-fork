module Lab4(
    input a0, 
    input a1, 
    input b0, 
    input b1,
    output reg RED, 
    output reg GREEN, 
    output reg BLUE
);

always @(*) begin
    RED = ((~a0) && (~a1)) || ((~a0) && b1) || (b0 && b1) || ((~a0) && b0) || ((~a1) && b0);
    GREEN = ((~a0) && b0) || ((~a1) && b1) || (a1 && (~b1)) || (a0 && (~b0));
    BLUE = ((~b0) && (~b1)) || (a0 && a1) || (a1 && (~b0)) || (a0 && (~b0)) || (a0 && (~b1));
end

endmodule
