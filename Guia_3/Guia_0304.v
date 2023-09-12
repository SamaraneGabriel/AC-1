/*
Guia_0304.v
Gabriel Samarane Ribeiro
725052
*/

module guia_0304;

//data

reg[4:0] a = 5'b11100;
integer c = 231;
reg[9:0] d = 10'o513;
reg[11:0] e = 12'h8B3;

reg[3:0] a1 = 4'b1101;
integer c1 = 132;
reg[9:0] d1 = 10'o173;
reg[11:0] e1 = 12'hC4F;

integer aux = 0;
integer aux1 = 0;

function integer quarToDec;
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
		
		quarToDec = resposta;
	end
endfunction
function integer decToQuar;
	input integer dec;
	integer resto,resposta,i;
	begin
		resto = 0;
		resposta = 0;
		i = 0;
		while(dec > 0)begin
			resto = dec%4;
			dec = dec/4;
			resposta = resposta + resto*(10**i);
			i++;
		end
		decToQuar = resposta;
	end
endfunction


  initial
  	begin: main
  	
	$display("%b - %b = %b",a,a1,a-a1);
	//caso especial, base 4
	
	aux = quarToDec(c);

	aux1 = quarToDec(c1);
	
	$display("%d - %d = %d",c,c1,decToQuar(aux-aux1));

  	$display("%o - %o = %o",d,d1,d-d1);
  	$display("%h - %h = %h",e,e1,e-e1);
  	end
endmodule
