module registradores(clk, d, enable, q);
    input [5:0] d;
    input clk, enable;
    output reg [5:0]q;
    
    initial begin
        q <= 0;
    end

    always @(posedge clk) begin
        if (enable == 1'b1) q <= d;
    end

endmodule