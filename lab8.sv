module lab8 (
    input logic reset ,
     logic clk ,
     logic direction ,
    output logic [7:0] segment,
     logic [6:0] led
);
logic[2:0] t_selector;
logic clk2;
logic[25:0] count_scroll;
//"for controlling the scrolling speed of numbers"
always_ff @(posedge clk or  posedge reset) begin
    if (reset) begin
        count_scroll<=0;
        clk2<=0;
    end
    else begin
        if (count_scroll==26'd49999999) begin
            clk2<=~clk2;
            count_scroll<=0;

        end
        else begin
            count_scroll=count_scroll+1;
        end
    end
end
//"blinking rate controller"
logic clock ; 
logic[16:0] count;
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
always_comb begin
    if (reset) begin
        t_selector[0] = 0;
    end
    else begin
        t_selector[0] =clock;
    end   
end
always_ff @(posedge clock or posedge reset) begin
    if (reset) begin
        t_selector[1] <= 0;
    end
    else begin
        t_selector[1] <= ~t_selector[1];
    end   
end
always_ff @(posedge t_selector[1] or posedge reset) begin
    if (reset) begin
        t_selector[2] <= 0;
    end
    else begin
        t_selector[2] <= ~t_selector[2];
    end 
end
logic [3:0] q;
logic [3:0]q0;
logic [3:0]q1;
logic [3:0]q2;
logic [3:0]q3;
logic [3:0]q4;
logic [3:0]q5;
logic [3:0]q6;
logic [3:0]q7;
logic [3:0]q8;
logic [3:0]q9;
logic [3:0]q10;
logic [3:0]q11;
logic [3:0]q12;
logic [3:0]q13;
logic [3:0]q14;
logic [3:0]q15;
always_ff @( posedge clk2 or  posedge reset ) begin 
    if (reset) begin
        


        q0=4'b0011;
        q1=4'b0000;
        q2=4'b0011;
        q3=4'b0011;
        q4=4'b1110;

        q5=4'b1110;
        q6=4'b0001;
        q7=4'b0000;
        q8=4'b1001;
        q9=4'b1111;
        q10=4'b1111;
        q11=4'b1111;
        q12=4'b1111;
        q13=4'b1111;
        q14=4'b1111;
        q15=4'b1111; 
    end
    else if (direction) begin
            q0<=q1;
            q1<=q2;
            q2<=q3;
            q3<=q4;
            q4<=q5;
            q5<=q6;
            q6<=q7;
            q7<=q8;
            q8<=q9;
            q9<=q10;
            q10<=q11;
            q11<=q12;
            q12<=q13;
            q13<=q14;
            q14<=q15;
            q15<=q0;
        end
        else begin
            q0<=q15;
            q1<=q0;
            q2<=q1;
            q3<=q2;
            q4<=q3;
            q5<=q4;
            q6<=q5;
            q7<=q6;
            q8<=q7;
            q9<=q8;
            q10<=q9;
            q11<=q10;
            q12<=q11;
            q13<=q12;
            q14<=q13;
            q15<=q14;    
        end
    end    
always_comb begin
    case (t_selector)
        3'h0 : q = q0;
        3'h1 : q = q1;
        3'h2 : q = q2;
        3'h3 : q = q3;
        3'h4 : q = q4;
        3'h5 : q = q5;
        3'h6 : q = q6;
        3'h7 : q = q7;
        
        default: begin
            q = 4'b0000;
        end
    endcase
end
always_comb begin
    case (q)
         4'h0 : led = 7'b0000001;
         4'h1 : led = 7'b1001111;
         4'h2 : led = 7'b0010010;
         4'h9 : led = 7'b0000100;
         4'h0 : led = 7'b0000001;
         4'hE : led = 7'b0110000;
        default: begin
            led = 7'b1111111;
        end
    endcase
end
always_comb begin 
    case (t_selector)
    3'h0 : segment = 8'b11111110;
    3'h1 : segment = 8'b11111101;
    3'h2 : segment = 8'b11111011;
    3'h3 : segment = 8'b11110111;
    3'h4 : segment = 8'b11101111;
    3'h5 : segment = 8'b11011111;
    3'h6 : segment = 8'b10111111;
    3'h7 : segment = 8'b01111111;
        default: begin
            segment = 8'b11111111;
        end
    endcase 
end   
endmodule