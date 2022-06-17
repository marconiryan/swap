module swap(x,clk,rst,done);
	input x,clk,rst;
	output reg done;
	

    // Registadores
    reg [5:0] R1 = 1;
    reg [5:0] R2 = 2;
    reg [5:0] R3 = 3;

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
            a: done = 1'b0;
			b: begin 
                    R3 <= R2;
                    done = 1'b0; 
                end
			c: begin 
                    R2 <= R1;
                    done = 1'b0; 
                end
			d: begin 
                    R1 <= R3;
                    done = 1'b1; 
                end
		endcase
	end
    
endmodule