module registradores(clk, reset, d, enable, q);
    input clk, reset, d, enable;
    output reg q;
    
    initial begin
        q <= 0;
    end

    always @(posedge clk, reset == 1'b1) begin
        if(reset == 1'b1) q<=0;
        else begin
            if (enable == 1'b1) q <= d;
        end
    end

endmodule