// -------------------------
// Guia_0700 - GATES
// Nome: Gabriel Samarane Ribeiro
// Matricula: 725052

module LU(input a, input b, input ctrl1, input ctrl2, output y);

	//Definindo data

	wire y0;
	wire y1;
	wire y2;
	wire y3;
	wire group1;
	wire group2;
	

	//Capturando os sinais das portas NAND, AND, OR e NOR

	and	 gateAnd (y0,a,b);
	nand gateNand(y1,a,b);	
	or   gateOr  (y2,a,b);
	nor  gateNor (y3,a,b); 

	// Seleção AND/NAND ou OR/NOR
    assign group1 = ctrl1 ? y1 : y0;
    assign group2 = ctrl1 ? y3 : y2;

    assign y = ctrl2 ? group2 : group1;
	

endmodule
	
module LU_test;
    reg a, b, ctrl1, ctrl2;
    wire y;
    integer i_ctrl1, i_ctrl2, i_a, i_b; 

    LU uut(a, b, ctrl1, ctrl2, y);  // Instanciando a LU

    initial begin
        $display("c1 | c2 | a | b || y");
        $display("-----------------------------");
        for (i_ctrl1 = 0; i_ctrl1 <= 1; i_ctrl1 = i_ctrl1 + 1) begin
            for (i_ctrl2 = 0; i_ctrl2 <= 1; i_ctrl2 = i_ctrl2 + 1) begin
                for (i_a = 0; i_a <= 1; i_a = i_a + 1) begin
                    for (i_b = 0; i_b <= 1; i_b = i_b + 1) begin
                        ctrl1 = i_ctrl1;
                        ctrl2 = i_ctrl2;
                        a = i_a;
                        b = i_b;
                        #10;  // Propagação do sinal
                        $display("%b  | %b | %b | %b  || %b", ctrl1, ctrl2, a, b, y);
                    end
                end
            end
        end
        $finish;
    end
endmodule


