module tristate(entrada,saida,controle);
    input [5:0]entrada;
    input controle;
    output reg [5:0]saida;
    always@(controle) begin
        if(controle == 1'b1)begin
            saida <= entrada;
        end
        else begin
            saida <= 5'bzzzzz;
        end

    end


endmodule