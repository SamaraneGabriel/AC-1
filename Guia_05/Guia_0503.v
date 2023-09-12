/*
Aluno: Gabriel Samarane Ribeiro [1313414]
Matricula: 725052
Matéria: Arquitetura de Computadores-1
Guia_0503
*/


module Guia_0502(output s, input a, input b);

	//Dados
	
	wire not_a;
	wire not_b;
	wire not_s;
	
	//Portas
	
	nor NOTa(not_a,a,a);
	
	nor NOTb(not_b,b,b);
	
	nor nor_gate_medio(not_s,not_a,not_b);
	
	nor nor_gate_final(s,not_s,not_s);
	

endmodule


module teste;

	//Dados para teste
	
	reg a;
	reg b;
	wire s;
	
	Guia_0502 moduloTeste(s,a,b);

initial
	begin: main
	
	
		$display("Guia_0503 - GabrielSamaraneRibeiro - 1313414");
		$display("Test module");
		$display(" a - b - s ");
		
		// projetar testes do modulo
		/*
			Fazendo a tabela verdade para prever resultados
			
				| a | b |  (~a|~b)|
				|---|---|---------|
				| 0 | 0 |    1    |
				| 0 | 1 |    1    |
				| 1 | 0	|    1    |
				| 1 | 1 |    0	  |
		*/
		
		
		$monitor("%4b %4b %4b", a, b, s);					
		 a = 1'b0; b = 1'b0;
		#1
		 a = 1'b0; b = 1'b1;
		#1
		 a = 1'b1; b = 1'b0;
		#1
		 a = 1'b1; b = 1'b1;
	end
endmodule
