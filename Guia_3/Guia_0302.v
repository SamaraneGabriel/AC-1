/*
Guia_0201.v
Gabriel Samarane Ribeiro
725052
*/


module guia_0302;


reg [9:0] a = 10'd312; // binary
reg [7:0] b = 8'h5F; // binary
reg [9:0] c = 10'd123; // binary
reg [8:0] d = 9'o147; // binary
reg [7:0] e = 8'hD5; // binary
reg [9:0] aux = 10'b0;


task C1;
	input reg[15:0] binary;
	input integer n;
	reg[31:0] aux;
	integer i;
	begin
		for(i = 0 ; i < n; i++)begin
			if(binary[i])begin
				aux[i] = binary[i];
			end
			else begin
				aux[i] = 0;
			end
		end
		aux = ~aux;
		for(i = n-1; i >= 0; i--)begin
			$write("%b",aux[i]);
		end
		$display("\n");
	end
endtask

task C2;
	input reg[15:0] binary;
	input integer n;
	reg[31:0] aux;
	integer i;
	begin
		aux = 0;
		for(i = 0 ; i < n; i++)begin
			if(binary[i])begin
				aux[i] = binary[i];
			end
			else begin
				aux[i] = 0;
			end
		end
		aux = ~(aux) + 1;
		for(i = n-1; i >= 0; i--)begin
			$write("%b",aux[i]);
		end
		$display("\n");
	end
endtask


function [31:0] convertToBinary;
    input [31:0] number; 
    reg [31:0] result;
    begin
	result = 32'b0;
	result = number;
	convertToBinary = result;
    end
endfunction


function [10:0] quarToBin;
	input integer quart;
	integer resto, resposta;
	integer i;
	begin
		i = 0;
		resposta = 0;
		while(quart > 0)begin
			resto = quart%10;
			quart = quart/10;
			resposta = resposta + resto*(4**i);
			i++;
		end
		
		quarToBin = convertToBinary(resposta);
	end
endfunction

initial
	begin: main
	
	aux = quarToBin(a);
	
	$display("a(4) = %d\n a(2) = %6b",a,aux);
	$write("C1(a) = ");
	C1(aux,6);
	
	$display("b(16) = %h\n b(2) = %b",b,b);
	$write("C1(b) = ");
	C1(convertToBinary(b),8);
	
	aux = quarToBin(c);
	
	$display("c(4) = %d\n c(2) = %6b",c,aux);
	$write("C2(c) = ");
	C2(aux,6);
	
	$display("d(8) = %o\n d(2) = %b",d,d);
	$write("C2(d) = ");
	C2(convertToBinary(d),10);
	
	$display("e(8) = %h\n e(2) = %b",e,e);
	$write("C2(e) = ");
	C2(convertToBinary(e),8);
	
	
	end
endmodule
