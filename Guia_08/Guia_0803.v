// -------------------------
// Guia_0802 - Comparador de Igualdade
// Nome: Gabriel Samarane Ribeiro
// Matricula: 725052
// -------------------------
// -------------------------
// Comparador de Igualdade
// -------------------------

	module comparador(input a, input b, output s);
		xnor XNOR_GATE(s,a,b);
	endmodule

	module test;

		reg  [0:0] result;

		reg  [5:0] A;
		reg  [5:0] B;

		reg  [5:0] C;
		reg  [5:0] D;

		wire [5:0] S1;
		wire [5:0] S2;

		initial begin
		//Associando valores iguais
		 
		A = 6'b100111;
		B = 6'b100111;
		
		//Associando valores distintos

		C = 6'b101010;
		D = 6'b010101;
		
		end
		
		//Instanciando o primeiro comparador

	    genvar i;
        generate 
            for (i = 0; i < 6; i = i + 1) begin
                comparador comp1(A[i], B[i], S1[i]);
                comparador comp2(C[i], D[i], S2[i]);
            end
        endgenerate

        // Display dos resultados
        initial begin
            $display("-------------- TESTE COMPARADOR-6-BITS ------------");
            $display("A = 100111,  B = 100111");
            #1;
			if(S1 == 6'b111111)begin
				$display("Os números são identicos");
			end
			else begin
				$display("Os números são distintos");
			end

            $display("C = 101010,  D = 010101");
            #1;
			if(S2 == 6'b111111)begin
				$display("Os números são identicos");
			end
			else begin
				$display("Os números são distintos");
			end            
        end
		
	endmodule
