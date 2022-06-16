module flip_flop_D(
    input reset,
    input clock,
    input d,
    output logic q);

always  @(posedge clock, posedge reset) 
begin
    if(reset)
    q <= 0;
    else
    q<=d;    
end
endmodule