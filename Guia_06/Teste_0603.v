module a (output s, input x, y, w, z);
    assign s = (~w&z&~x) | (~w&y&z) | (x&~z&~y) | (w&~z&~y) ;
endmodule // Teste para a simplificação feita pelo mapa

module b (output s, input x, y, w, z);
    assign s = (~x&z) | (~x&~y&~w) | (y&~w&z) | (w&z&~y);
endmodule // Teste para a simplificação feita pelo mapa

module c (output s, input x, y, w, z);
    assign s = (~x&~w&~y) | (w&~z&~x) | (z&y&w) | (x&~y&z);
endmodule // Teste para a simplificação feita pelo mapa

module d (output s, input x, y, w, z);
	assign s = (~x&~w&y) | (y&z&~x) | (z&x&~w) | (w&x&~z&y) | (~x&~z&w&~y);   
endmodule // Teste para a simplificação feita pelo mapa

module e (output s, input x, y, w, z);
    assign s = (~x&z&~w) | (~w&y&z) | (~y&w&~z) | (x&~y&~z);
endmodule // Teste para a simplificação feita pelo mapa

module tb_main;

    reg w, x, y, z;
    wire sa, sb, sc, sd, se;

    a uuta (sa, x, y, w, z);
    b uutb (sb, x, y, w, z);
    c uutc (sc, x, y, w, z);
    d uutd (sd, x, y, w, z);
    e uute (se, x, y, w, z);

    initial begin
        tb_SoPa();
        tb_SoPb();
        tb_SoPc();
        tb_SoPd();
        tb_SoPe();
        $finish;  
    end

	task tb_SoPa();
	    integer i, j, k, l;
	    begin
	        $display("Iniciando Simulação para A...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    for (l = 0; l <= 1; l = l + 1) begin
	                        x = i; y = j; w = k; z = l;
	                        #1;
	                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, sa);
	                    end
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPb();
	    integer i, j, k, l;
	    begin
	        $display("Iniciando Simulação para B...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    for (l = 0; l <= 1; l = l + 1) begin
	                        x = i; y = j; w = k; z = l;
	                        #1;
	                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, sb);
	                    end
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPc();
	    integer i, j, k, l;
	    begin
	        $display("Iniciando Simulação para C...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    for (l = 0; l <= 1; l = l + 1) begin
	                        x = i; y = j; w = k; z = l;
	                        #1;
	                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, sc);
	                    end
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPd();
	    integer i, j, k, l;
	    begin
	        $display("Iniciando Simulação para D...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    for (l = 0; l <= 1; l = l + 1) begin
	                        x = i; y = j; w = k; z = l;
	                        #1;
	                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, sd);
	                    end
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPe();
	    integer i, j, k, l;
	    begin
	        $display("Iniciando Simulação para E...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    for (l = 0; l <= 1; l = l + 1) begin
	                        x = i; y = j; w = k; z = l;
	                        #1;
	                        $display("x=%b y=%b w=%b z=%b | %b", x, y, w, z, se);
	                    end
	                end
	            end
	        end
	     end
	endtask

	
	


  endmodule
