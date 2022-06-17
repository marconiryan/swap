`include "swap.v"
module testbench;

    reg x = 0,clk = 0,rst = 0;
    wire done;
    swap sw(x,clk,rst,done);

always #1 clk <= ~clk;
always #2 x <= ~x;
initial begin
    $dumpvars;
    #500;
    $finish;

end

endmodule