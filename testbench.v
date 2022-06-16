`include "proximo_estado.v"
module testbench;
    reg w = 0, y0 = 0, y1 = 0;
    wire r0,r1;
    proximo_estado pe(w,y0,y1,r0,r1);
initial begin
    $dumpvars;
    #2
    w <= 1;
    #2
    y0 <= 1;
    #2
    y1 <= 1;
    #2
    y0 <= 0;
    $finish;

end


endmodule