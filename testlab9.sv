module lab9(
    input logic  [2:0] bit_index,
    input logic  bit_value,
    input logic  valid_in,
    input logic  clk,
    input logic  reset,
    input logic  write,
    output logic [7:0] segment,
    output logic [6:0] led
);

logic [7:0] q;
logic [16:0] count;
logic clock;
logic [7:0] result;

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 8'b00000000;
        clock <= 0;
        count <= 0;
    end
    else begin
        if (count == 17'd124999) begin 
            clock <= ~clock;
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
        if (bit_value) begin
            q <= result[7:4];
        end
        else begin
            q <= result[3:0];
        end
    end
end

always_comb begin 
    case (bit_index)
       3'b000 : mask = 8'b00000001; 
       3'b001 : mask = 8'b00000010; 
       3'b010 : mask = 8'b00000100; 
       3'b011 : mask = 8'b00001000; 
       3'b100 : mask = 8'b00010000; 
       3'b101 : mask = 8'b00100000;
       3'b110 : mask = 8'b01000000; 
       3'b111 : mask = 8'b10000000; 
       default: mask = 8'b00000000;
    endcase
end

always_comb begin
    if (bit_value) begin
        result = q & mask;
    end
    else begin
        result = q | mask;
    end
end

always_comb begin 
    case (q)
         4'h0 : led = 7'b0000001;
         4'h1 : led = 7'b1001111;
         4'h2 : led = 7'b0010010;
         4'h3 : led = 7'b0000110;
         4'h4 : led = 7'b1001100;
         4'h5 : led = 7'b0100100;
         4'h6 : led = 7'b0100000;
         4'h7 : led = 7'b0001111;
         4'h8 : led = 7'b0000000;
         4'h9 : led = 7'b0000100;
         4'hA : led = 7'b0001000;
         4'hB : led = 7'b1100000;
         4'hC : led = 7'b0110001;
         4'hD : led = 7'b1000010;
         4'hE : led = 7'b0110000;
         4'hF : led = 7'b0111000;
         default: led = 7'b1111111;
    endcase 
end

always_comb begin
    case (clock)
    3'h0 : segment = 8'b11111110;
    3'h1 : segment = 8'b11111101;
    default: segment = 8'b11111111;
    endcase
end

endmodule
