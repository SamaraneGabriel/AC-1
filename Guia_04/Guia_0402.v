module Guia_0402;

task a;
	input reg[0:0] x;
	input reg[0:0] y;
	begin
		$display("Expressão:  x' . ( x + y' )'");
		$display("Resultado pela expressão inicial: %b",~x&~(x | ~y));
		$display("Expressão Simplificada: x'.y");
		$display("Resultado pela expressão simplificada: %b",~x&y);
		$display("\n");
	end
endtask

task b;
	input reg[0:0] x;
	input reg[0:0] y;
	begin
		$display("Expressão:  (x' + y') + ( x . y' ) ");
		$display("Resultado pela expressão inicial: %b",(~x | ~y) | (x&~y));
		$display("Expressão Simplificada: x' + y'");
		$display("Resultado pela expressão simplificada: %b",~x | ~y);
		$display("\n");
	end
endtask
task c;
	input reg[0:0] x;
	input reg[0:0] y;
	begin
		$display("Expressão:   ( x . y )' . ( x' + y' )");
		$display("Resultado pela expressão inicial: %b",~(x&y) & (~x | ~y));
		$display("Expressão Simplificada: x' + y'");
		$display("Resultado pela expressão simplificada: %b",~x | ~y);
		$display("\n");
	end
endtask
task d;
	input reg[0:0] x;
	input reg[0:0] y;
	begin
		$display("Expressão:  ( x . y )' + ( x + y )'");
		$display("Resultado pela expressão inicial: %b",~(x&y) | ~(x | y));
		$display("Expressão Simplificada: x' + y'");
		$display("Resultado pela expressão simplificada: %b",~x | ~y);
		$display("\n");
	end
endtask
task e;
	input reg[0:0] x;
	input reg[0:0] y;
	begin
		$display("Expressão:  ( y + x )' . ( y' + x' ) ");
		$display("Resultado pela expressão inicial: %b",~(y + x)&(~y | ~x));
		$display("Expressão Simplificada: y' . x'");
		$display("Resultado pela expressão simplificada: %b",~y & ~x);
		$display("\n");
	end
endtask

initial
	begin: main
	
	a(0,1);
	b(0,1);
	c(0,1);
	d(0,1);
	e(0,1);
	end

endmodule
