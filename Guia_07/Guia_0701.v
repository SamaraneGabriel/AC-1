// -------------------------
// Guia_0701 - GATES
// Nome: Gabriel Samarane Ribeiro
// Matricula: 725052

module LU(input a, input b, input ctrl, output y0, output y1, output y);

	//Capturando os sinais das portas NAND e AND

	nand gateNand(y0,a,b);
	and  gateAnd (y1,a,b); 

	//Definindo o multiplexador

	wire mux0;
	wire mux1;
	wire not_ctrl;
	
	not NOT(not_ctrl,ctrl);

	and AND0(mux0,y0,not_ctrl);

	and AND1(mux1,y1,ctrl);

	or OR(y,mux0,mux1);

endmodule
	
module LU_test;


    reg a, b, ctrl;
    wire y0, y1, y;
	integer i_ctrl, i_a, i_b; // Variáveis locais para a iteração

    // Instanciando o módulo LU
    LU moduloTeste0(a, b, ctrl, y0, y1, y);

    // Inicialização e teste
    initial begin
        
        $display("ctrl | a | b || NAND | AND | y");
        $display("-----------------------------");
        
        for (i_ctrl = 0; i_ctrl <= 1; i_ctrl = i_ctrl + 1) begin
            for (i_a = 0; i_a <= 1; i_a = i_a + 1) begin
                for (i_b = 0; i_b <= 1; i_b = i_b + 1) begin
                    ctrl = i_ctrl; // Atribuindo valores das variáveis locais para os regs
                    a = i_a;
                    b = i_b;
					#10;  // Delay para simular o tempo necessário para a propagação do sinal
                    $display("%b | %b | %b  || 	%b| 	%b|  %b", ctrl, a, b, y0, y1, y);
                end
            end
        end
        
        $finish;  // Terminar a simulação após todos os testes
    end

endmodule


