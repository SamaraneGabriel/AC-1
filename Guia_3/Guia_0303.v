/*
Guia_0303.v
Gabriel Samarane Ribeiro
725052
*/
module guia_0303;


reg [4:0] a = 5'b10101; // binary
reg [5:0] b = 6'b110011; // binary
reg [5:0] c = 6'b100111; // binary
reg [6:0] d = 7'b1011011; // binary
reg [6:0] e = 7'b1010001; // binary

function [31:0] invC2;
	input reg[15:0] binary;
	input integer n;
	reg[31:0] aux;
	reg[31:0] resp;
	integer i;
	begin
		resp = 0;
		aux = 0;
		for(i = 0 ; i < n; i++)begin
			if(binary[i])begin
				aux[i] = binary[i];
			end
			else begin
				aux[i] = 0;
			end
		end
		
		aux = aux - 1;
		aux = ~(aux);
		
		for(i = 0 ; i < n; i++)begin
			if(aux[i])begin
				resp[i] = aux[i];
			end
			else begin
				resp[i] = 0;
			end
		end
		
		invC2 = resp;
	end
	
endfunction


initial
	begin: main
		$display("GUIA_0303.V");
		$display("C2⁻¹(%b)(10) = %d",a,invC2(a,5));
		$display("C2⁻¹(%b)(10) = %d",b,invC2(b,6));
		$display("C2⁻¹(%b) = %6b",c,invC2(c,6));
		$display("C2⁻¹(%b) = %6b",d,invC2(d,7));
		$display("C2⁻¹(%b)(16) = %h",e,invC2(e,7));
			
	end
endmodule
