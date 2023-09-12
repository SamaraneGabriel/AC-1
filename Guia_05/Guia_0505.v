/*
Aluno: Gabriel Samarane Ribeiro [1313414]
Matricula: 725052
Matéria: Arquitetura de Computadores-1
Guia_0505
*/


module Guia_0505(output s, input a, input b);

  //	Função:	~(a^b) = 
  //	nor: ~(a|b)
  //	~(a^b) = (~a&~b) | (a&b) = ~(a|b) | (~a|~b)
  	//Dados
	wire not_a;
	wire not_b;
	wire w1, w2;
	wire not_or;

  	
  	//Portas
  	
  	nor NOTa(not_a,a,a);
  	
  	nor NOTb(not_b,b,b);
  	
  	nor NOR1(w1,not_a,not_b);
	
	nor NOR2(w2,a,b);
	
	nor OR(not_or,w1,w2);
	
	nor final(s,not_or,not_or);

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
			
				| a | b |  ~(a^b) | 
				|---|---|---------|
				| 0 | 0 |    1    |
				| 0 | 1 |    0    |
				| 1 | 0	|    0    |
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
