/*
Aluno: Gabriel Samarane Ribeiro [1313414]
Matricula: 725052
Matéria: Arquitetura de Computadores-1
Guia_0504
*/


module Guia_0504(output s, input a, input b);

  //	Função:	~(~a&b)
  //	nand: ~(a&b)
  
  	//Dados
	
	wire not_a;
	
	//Portas
	
  	nand NOTa(not_a,a,1);
  	
  	nand nand_gate(s,not_a,b);
  	

endmodule


module teste;

	//Dados para teste
	
	reg a;
	reg b;
	wire s;
	
	Guia_0504 moduloTeste(s,a,b);

initial
	begin: main
	
	
		$display("Guia_0504 - GabrielSamaraneRibeiro - 1313414");
		$display("Test module");
		$display(" a - b - s ");
		
		// projetar testes do modulo
		/*
			Fazendo a tabela verdade para prever resultados
			
				| a | b | ~(~a&b) | 
				|---|---|---------|
				| 0 | 0 |    1    |
				| 0 | 1 |    0    |
				| 1 | 0	|    1    |
				| 1 | 1 |    1	  |
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
