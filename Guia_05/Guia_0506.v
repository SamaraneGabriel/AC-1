/*
Aluno: Gabriel Samarane Ribeiro [1313414]
Matricula: 725052
Matéria: Arquitetura de Computadores-1
Guia_0505
*/


module Guia_0505(output s, input a, input b);

  //	Função:	(a^b)  
  //	nand: ~(a&b)
  //	~(a&b) = (a|b)&(~a|~b) = ~(~a & ~b) & ~(a & b)
  // 	NOTA: A expressão final é apenas o "produto" de 2 NANDS
  
  
  	//Dados
	wire not_a;
	wire not_b;
	wire w1, w2;
	wire not_and;
  	
  	//Portas
  	
  	nand NOTa(not_a,a,1);
  	
  	nand NOTb(not_b,b,1);
  	
  	nand NAND1(w1,not_a,not_b);
	
	nand NAND2(w2,a,b);
	
	nand AND(not_and,w1,w2);
	
	nand final(s,not_and,1);

endmodule


module teste;

	//Dados para teste
	
	reg a;
	reg b;
	wire s;
	
	Guia_0505 moduloTeste(s,a,b);

initial
	begin: main
	
	
		$display("Guia_0505 - GabrielSamaraneRibeiro - 1313414");
		$display("Test module");
		$display(" a - b - s ");
		
		// projetar testes do modulo
		/*
			Fazendo a tabela verdade para prever resultados
			
				| a | b |  (a^b)  | 
				|---|---|---------|
				| 0 | 0 |    0    |
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
