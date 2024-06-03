module lab6 (
    input logic [2:0] sel, 
    input logic [3:0] num,
    input logic clk,
    input logic write,
    input logic reset, 
    output logic [6:0] segments 
    output logic [7:0]display,
      
);
logic clk2=0;
 logic count [18:0];
  logic sel2
always_ff @( posedge clk ) begin 
    if (reset) begin
        count<=0;
        clk2<=0;

        
    end
    else begin
        if (count == 500000) begin
            clk2=~clk2;
            count <=0;
        else begin
            count=count+1;
        end
            
        end
    end

end
always_comb begin
    
    

    if (reset==0) begin
        sel2[0]=0;
    else begin
        sel2[0]=clk2;
            
        end
    end

end


always_ff @( posedge clk2 ) begin 
    
    if (reset) begin
        sel2[1]=0;
        
    end
    else begin
        sel2[1]=~clk2;
    end
    
end
always_ff @( posedge sel2[1] ) begin 
    if (reset==0) begin
        sel2[2]=0;
        
    end
    else begin
        sel2[2]=~sel2[1];
    end
    
end


    
logic [3:0]a0;
logic [3:0]a1;
logic [3:0]a2;
logic [3:0]a3;
logic [3:0]a4;
logic [3:0]a5;
logic [3:0]a6;
logic [3:0]a7;
logic [3:0]f;
logic [3:0]m;

f[3]<=write;  f[2]<=sel[2]; f[1]<=sel[1];  f[0]<=sel[0];
always_ff @( posedge clk  ) begin : 
if (reset ) begin
    a0<=0;
    a1<=0;
    a2<=0;
    a3<=0;
    a4<=0;
    a5<=0;
    a6<=0;
    a7<=0;
    
end
else begin
    case (f)
        4b'1000: a0<=num;
        4b'1001: a1<=num;
        4b'1010: a2<=num;
        4b'1011: a3<=num;
        4b'1100: a4<=num;
        4b'1101: a5<=num;
        4b'1110: a6<=num;
        4b'1111: a7<=num;

        default: begin
            a0<=a0;a1<=a1;a2<=a2;a3<=a3;a4<=a4;a5<=a5;a6<=a6;a7<=a7;
        end
    endcase
end

 

always_comb begin : 
    
case (sel)
   3b'000 : m<=a0;
   3b'001 : m<=a1;
   3b'010 : m<=a2;
   3b'011 : m<=a3;
   3b'100 : m<=a4;
   3b'101 : m<=a5;
   3b'110 : m<=a6;
   3b'111 : m<=a7;

    default: begin
        m=4b'0000;       
    end
endcase
   
end
always_comb begin : 
    if (write==0) 
       case(sel)
    3'b000:display=8'b11111110;
    3'b001:display=8'b11111101;
    3'b010:display=8'b11111011;
    3'b011:display=8'b11110111;
    3'b100:display=8'b11101111;
    3'b101:display=8'b11011111;
    3'b110:display=8'b10111111;
    3'b111:display=8'b01111111;
        default: begin
            display=8'b11111111;
        end
    endcase
     else begin
        display=8'b11111111;
    end   
end
always_comb begin 
    case (m)
    4'h0:segments=7'b0000001;
    4'h1:segments=7'b1001111;
    4'h2:segments=7'b0010010;
    4'h3:segments=7'b0000110;
    4'h4:segments=7'b1001100;
    4'h5:segments=7'b0100100;
    4'h6:segments=7'b0100000;
    4'h7:segments=7'b0001111;
    4'h8:segments=7'b0000000;
    4'h9:segments=7'b0000100;
    4'hA:segments=7'b0001000;
    4'hB:segments=7'b1100000;
    4'hC:segments=7'b0110001;
    4'hD:segments=7'b1000010;
    4'hE:segments=7'b0110000;
    4'hF:segments=7'b0111000;
        default: begin
         segments=7'b1111111;
        end
    endcase
    
end   
end 
endmodule