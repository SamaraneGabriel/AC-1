//Dedicado para encontrar as tabela verdade das expressões booleanas referentes aos circutios do Logisim       Guia_0605

module tabela (output s, input x, y, z);
    assign s = (~(~x|~y)&(~(x&y))) | ~((y&z) | ~x);
endmodule

module tabelaSim (output s, input x, y, z);
    assign s = (x&~z) | (x&~y);
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
