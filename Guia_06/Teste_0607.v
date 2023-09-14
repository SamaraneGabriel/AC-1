 	//Dedicado para encontrar as tabela verdade das expressões booleanas referentes aos circutios do Logisim       Guia_0607
 	
 	module tabela (output s1, input X, input Y, input Z);
 		assign s1 = ( X | ~Y | ~Z ) & (~X | Y | ~Z) & ( ~X | Y | Z );
 	endmodule // FXYZ
 	
 	module tabelaSim (output s2, input X, Y, Z);
 	    assign s2 = (~X|Y)&(X|~Y|~Z);
 	endmodule
 	
 	module tb_main;
 	
 	    reg x, y, z;
 	    wire s1, s2;
 	
 	    tabela uutteste (s1, x, y, z);
 	    tabelaSim uuttesteSim (s2, x, y, z);
 	
 	
 	    initial begin
 	        teste();
 	        testeSimplificado();
 	        $finish;  
 	    end
 	
 		task teste();
 		    integer i, j, k, l;
 		    	begin
 		        $display("Tabela verdade para circuito não simplificado: ");
 		            for (j = 0; j <= 1; j = j + 1) begin
 		                for (k = 0; k <= 1; k = k + 1) begin
 		                    for (l = 0; l <= 1; l = l + 1)begin
 		                        x = j; y = k;  z = l;
 		                        #1;
 		                        $display("x=%b y=%b z=%b | %b", x, y, z, s1);
 		                    end
 		                end
 		            end
 		        end
 		endtask
 	
 			task testeSimplificado();
 		    integer i, j, k, l;
 		    	begin
 		        $display("Tabela verdade para circuito simplificado: ");
 		            for (j = 0; j <= 1; j = j + 1) begin
 		                for (k = 0; k <= 1; k = k + 1) begin
 		                    for (l = 0; l <= 1; l = l + 1)begin
 		                        x = j; y = k;  z = l;
 		                        #1;
 		                        $display("x=%b y=%b z=%b | %b", x, y, z, s2);
 		                    end
 		                end
 		            end
 		        end
 		endtask  
 		       
 	
 	
 	 endmodule
 	
