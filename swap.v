`include "registradores.v"
`include "tristate.v"
`include "circuito_controle.v"

module swap(barramento,clk,reset,w,done);
    inout [5:0]barramento;
    input clk, reset, w;
    output done;
    wire [5:0] saida_R1, saida_R2, saida_R3;
    registradores r1(clk,barramento, c1, saida_R1);
    registradores r2(clk,barramento, c2, saida_R2);
    registradores r3(clk,barramento, c3, saida_R3);
    tristate t1(saida_R1,barramento,h1);
    tristate t2(saida_R2,barramento,h2);
    tristate t3(saida_R3,barramento,h3);
    circuito_controle cc(w,clk,reset, c1, c2, c3, h1, h2, h3, done);

endmodule