module a (output s, input x, y, z);
    assign s = (~x & z) | (z&y);
endmodule // Teste para a simplificação feita pelo mapa

module b (output s, input x, y, z);
    assign s = (~z&~x) | (~z&y);
endmodule // Teste para a simplificação feita pelo mapa

module c (output s, input x, y, z);
    assign s = (~z&y) | (~z&x) | (x&~y);
endmodule // Teste para a simplificação feita pelo mapa

module d (output s, input x, y, z);
    assign s = (z&~x) | (~x&y) | (x&~y) | (z&~y);
endmodule // Teste para a simplificação feita pelo mapa

module e (output s, input x, y, z);
    assign s = (~z&~y) | (x&~y) | (z&x);
endmodule // Teste para a simplificação feita pelo mapa

module tb_main;

    reg x, y, z;
    wire sa, sb, sc, sd, se;

    a uuta (sa, x, y, z);
    b uutb (sb, x, y, z);
    c uutc (sc, x, y, z);
    d uutd (sd, x, y, z);
    e uute (se, x, y, z);

    initial begin
        tb_SoPa();
        tb_SoPb();
        tb_SoPc();
        tb_SoPd();
        tb_SoPe();
        $finish;  
    end

	task tb_SoPa();
	    integer i, j, k;
	    begin
	        $display("Iniciando Simulação para A...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    x = i; y = j; z = k;
	                    #1;
	                    $display("x=%b y=%b z=%b | sa=%b", x, y, z, sa);
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPb();
	    integer i, j, k;
	    begin
	        $display("Iniciando Simulação para B...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    x = i; y = j; z = k;
	                    #1;
	                    $display("x=%b y=%b z=%b | sa=%b", x, y, z, sb);
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPc();
	    integer i, j, k;
	    begin
	        $display("Iniciando Simulação para C...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    x = i; y = j; z = k;
	                    #1;
	                    $display("x=%b y=%b z=%b | sa=%b", x, y, z, sc);
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPd();
	    integer i, j, k;
	    begin
	        $display("Iniciando Simulação para D...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    x = i; y = j; z = k;
	                    #1;
	                    $display("x=%b y=%b z=%b | sa=%b", x, y, z, sd);
	                end
	            end
	        end
	     end
	endtask

	task tb_SoPe();
	    integer i, j, k;
	    begin
	        $display("Iniciando Simulação para E...");
	        for (i = 0; i <= 1; i = i + 1) begin
	            for (j = 0; j <= 1; j = j + 1) begin
	                for (k = 0; k <= 1; k = k + 1) begin
	                    x = i; y = j; z = k;
	                    #1;
	                    $display("x=%b y=%b z=%b | sa=%b", x, y, z, se);
	               	end
	            end
	        end
	     end
	endtask

endmodule
