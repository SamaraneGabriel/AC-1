//Dedicado para encontrar as tabela verdade das expressões booleanas referentes aos circutios do Logisim GUIA_0606

module tabela (output s, input x, y, w, z);		
    assign s = ((~(w | ~x | ~y)) & (~(y&x&~w))) + (~((y&w&z)|~x));										//(((w + x' + y')') . ((y.x.w')')) + (((y.w.z)+x')')
endmodule

module tabelaSim (output s, input x, y, w, z);
    assign s = x & (~w | ~y | ~z);																		//X.(Y'+ W' + Z')
endmodule
module tb_main;

    reg x, y, z, w;
    wire s1, s2;

    tabela uutteste (s1, x, y, w, z);
    tabelaSim uuttesteSim (s2, x, y, w, z);


    initial begin
        teste();
        testeSimplificado();
        $finish;  
    end

	task teste();
	    integer i, j, k, l;
	    begin
	        $display("Tabela verdade para circuito não simplificado");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    for (l = 0; l <= 1; l = l + 1) begin
	                        x = i; y = j; w = k; z = l;
	                        #1;
	                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, s1);
	                    end
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
	                    	for(i = 0; i <= 1; i = i + 1)begin
		                        x = j; y = k; w = l; z = i; 
		                        #1;
		                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, s2);
	                        end
	                    end
	                end
	            end
	        end
	endtask 
	       


 endmodule
