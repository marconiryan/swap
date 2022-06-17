module circuito_controle(x,clk,rst,c1,c2,c3,h1,h2,h3,done);
	input x,clk,rst;
	output reg c1,c2,c3,h1,h2,h3,done;
	
	// Registrador de estado
	reg [1:0] state;
	
	//Codificaçao dos estados;
	parameter a = 2'b00,
	          b = 2'b01,
				 c = 2'b10,
				 d = 2'b11;
	//Inicialização da maquina
	initial begin
		state <= a;
	end
	
	//Proximo Estado
	always @(posedge clk, posedge rst) begin
		if(rst == 1'b1) state <= a;
		else begin
			case(state)
			a: begin
				if(x==1'b1) state <= b;
				else state <= a;
			end
			b: begin
				state <= c;
			end
			c: begin
				state <= d;
			end
			d: begin
				state <= a;
			end
			endcase
		end
	end
	
	
	//Saida
	always @(state)begin
		case(state)
			a: begin c1 = 1'b0; c2 = 1'b0; c3 = 1'b0; h1 = 1'b0; h2 = 1'b0; h3 = 1'b0; done = 1'b0; end
			b: begin c1 = 1'b0; c2 = 1'b0; c3 = 1'b1; h1 = 1'b0; h2 = 1'b1; h3 = 1'b0; done = 1'b0; end
			c: begin c1 = 1'b0; c2 = 1'b1; c3 = 1'b0; h1 = 1'b1; h2 = 1'b0; h3 = 1'b0; done = 1'b0; end
			d: begin c1 = 1'b1; c2 = 1'b0; c3 = 1'b0; h1 = 1'b0; h2 = 1'b0; h3 = 1'b1; done = 1'b1; end
		endcase
	end
    
endmodule