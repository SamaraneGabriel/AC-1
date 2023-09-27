// -------------------------
// Guia_0704 - GATES
// Nome: Gabriel Samarane Ribeiro
// Matricula: 725052

//Definindo modulo que realiza AND em 3 entradas

module AND_3(output s, input a, input b, input c);
	assign s = a & b & c;
endmodule

//Definindo modulo que realiza OR em 4 entradas

module OR_4(output s, input a, input b, input c, input d);
	assign s = a | b | c | d;
endmodule



//Definindo o multiplexador

module mux (input a, input b, input c, input d, input ctrl1, input ctrl2, output s);
	//Definindo dados do MUX

	wire not_ctrl1;
	wire not_ctrl2;
	wire sa;
	wire sb;
	wire sc;
	wire sd;

	//Definindo portas

	not NOT_1(not_ctrl1,ctrl1);
	not NOT_2(not_ctrl2,ctrl2);

	AND_3 AND_0(sa,a,not_ctrl1,not_ctrl2);
	AND_3 AND_1(sb,b,not_ctrl1,ctrl2);
	AND_3 AND_2(sc,c,ctrl1,not_ctrl2);
	AND_3 AND_3(sd,d,ctrl1,ctrl2);

	OR_4  OR(s,sa,sb,sc,sd);

endmodule


module LU (input a, input b, input ctrl1, input ctrl2, output s0, output s1, output s2, output s3, output s);

	//Definindo data

	wire s0;
	wire s1;
	wire s2;
	wire s3;

	//Definindo portas

	xor  XOR_GATE(s0,a,b);
	xnor XNOR_GATE(s1,a,b);
	or   OR_GATE(s2,a,b);
	nor  NOR_GATE(s3,a,b);

	//Modulo para a lógica do MUX

	mux MUX(s0,s1,s2,s3,ctrl1,ctrl2,s);

endmodule	


module LU_test;
    reg a, b, ctrl1, ctrl2;
    wire xor_out, xnor_out, or_out, nor_out, y;
    integer i_ctrl1, i_ctrl2, i_a, i_b; 

    LU uut(a, b, ctrl1, ctrl2, xor_out, xnor_out, or_out, nor_out, y);  // Instanciando a LU

    initial begin
        $display(" A | B | CTRL1 | CTRL2 || XOR | XNOR |  OR | NOR || f ");
        $display("----------------------------------------------------------");
        for (i_ctrl1 = 0; i_ctrl1 <= 1; i_ctrl1 = i_ctrl1 + 1) begin
            for (i_ctrl2 = 0; i_ctrl2 <= 1; i_ctrl2 = i_ctrl2 + 1) begin
                for (i_a = 0; i_a <= 1; i_a = i_a + 1) begin
                    for (i_b = 0; i_b <= 1; i_b = i_b + 1) begin
                        ctrl1 = i_ctrl1;
                        ctrl2 = i_ctrl2;
                        a = i_a;
                        b = i_b;
                        #10;  // Propagação do sinal
                        $display(" %b | %b |   %b  |   %b   ||  %b  |   %b   |   %b  |  %b  || %b", 
                                 a, b, ctrl1, ctrl2, xor_out, xnor_out, or_out, nor_out, y);
                    end
                end
            end
        end
        $finish;
    end
endmodule
