module proximo_estado(w,entrada_y0,entrada_y1,saida_y0,saida_y1);
    input w, entrada_y0, entrada_y1;
    output saida_y0, saida_y1;
    assign saida_y0 = (w & ~entrada_y0)| (~entrada_y0 & entrada_y1);
    assign saida_y1 =  (~entrada_y1 & entrada_y0)| (~entrada_y0 & entrada_y1);

endmodule


