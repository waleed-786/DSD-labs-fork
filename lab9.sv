module lab9(
    input logic  [2:0] bit_index,
     logic  bit_value,
    logic valid_in,
    logic enable,
    
    logic clk,
    logic reset,
    logic write,
    output logic [7:0] segment,
    logic [6:0]led


);
logic [7:0] q;
logic q0,q1,q2,q3,q4,q5,q6,q7;
logic[16:0] count;
logic clock;
logic[7:0] result;

always_ff @(posedge clk  or posedge reset) begin 
    if (reset or !enable) begin
        q=8'b00000001;
    end
    elseif 
         (enable) begin
          mask[0]<=mask[7];  
          mask[1]<=mask[0]; 
          mask[2]<=mask[1]; 
          mask[3]<=mask[2]; 
          mask[4]<=mask[3]; 
          mask[5]<=mask[4]; 
          mask[6]<=mask[5]; 
          mask[7]<=mask[6]; 
        
        
        end
    
    else begin
        q <= result;
    end
    
end

always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        clock <= 0;
        count <= 0;
    end
    else begin
        if (count == 17'd124999) begin 
            clock <= ~clock;
            count <= 0;
        end
        else begin
            count <= count+1;
        end
        
    end
    
end
logic [7:0] mask;
logic [7:0] mask1;

always_comb
begin
    case (bit_value)
       1'b1 : mask1=mask;
       1'b0 : mask1=~mask;
        default: mask1=mask;
    endcase
end 

always_comb begin
    if (bit_value) begin
        result=q&mask1;
    end
    else begin
        result=q|mask1;
    end
end


always_ff @(posedge clk or posedge reset)begin
    Q<=q[3:0];
    R<=q[7:4];
end
always_comb begin
    if (clock) begin
        q=Q;
    end
    else begin
        q=R;
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

        default: begin
            led = 7'b1111111;
        end
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