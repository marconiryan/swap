`include "flip_flop_D.v"

module controle(
    input w,
    input clk,
    input reset,
    output c1,
    output c2,
    output c3,
    output h1,
    output h2,
    output h3,
    output done);
    wire y0,Y0,y1,Y1;

    flip_flop_D f1(reset, clk, Y1, y1);
    flip_flop_D f2(reset, clk, Y0, y0);
    assign Y1 = (~y1 & y0) | (~y0 & y1);
    assign Y0 = (~y0 & y1) | (w & y0);
    assign c1 = y1 & y0;
    assign done = c1;
    assign h3 = c1;
    assign c2 = y1 & y0;
    assign h1 = c2;
    assign c3 = y0 & ~y1;
    assign h2 = c3;
endmodule

