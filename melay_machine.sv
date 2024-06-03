module melay_machine (
    input logic reset;
    input logic clk;
    input logic x;
    output logic y;
    
);
parameter s0 =2'b00 ;
parameter s1=2'b10;
parameter s2=2'b11;
parameter s3=2'b20;
parameter s4=2'b21;
parameter s5=2'b30;
parameter s6=2'b31;
logic [1:0] ns,cs;
always_ff @( posedge clk or reset ) begin 
    if (reset) begin
        cs<=s0;
    else cs<=ns;
    end
    
end
always_comb begin 
    case (cs)
        s0:if (x==0) begin
            ns<=s1;
        end 
        else ns<=s2;
        s1:if (x==0) begin
            ns<=s3;
        end
        else ns<=s4;
        s2:if (x==0) begin
            ns<=s4;
        end
        else ns<=s4;
        s3:if (x==0) begin
            ns<=s5;
        end
        else ns<=s5;
        s4:if (x==0) begin
            ns<=s6;
        end
        else ns<=s6;
        s5:if (x==0) begin
            ns<=s0;

        end
        else ns<=s0;
        s6:if (x==0) begin
            ns<=s0;

        end
        else ns<=s0;
        default: ns<=s0;
    endcase
end
always_comb begin 
    case (cs)
        s0:if (x==0) begin
            y<=1;
        end 
        else y=0;
        s1:if (x==0) begin
            y<=1;
        end
        else y<=0;
        s2:if (x==0) begin
            y<=0;
        end
        else y<=1;
        s3:if (x==0) begin
            y<=0;
        end
        else y<=1;
        s4:if (x==0) begin
            y<=1;
        end
        else y<=0;
        s5:if (x==0) begin
            y<=0;    
        end
        else y<=1;
        s6:if (x==0) begin
            y<=0;    
        end
        else y<=1;
        default: y<=0;
    endcase
end

    
endmodule