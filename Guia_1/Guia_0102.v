/*
Guia_0102.v
Gabriel Samarane Ribeiro
*/
module Guia_0102;
// define data
integer aux = 0; 
reg[7:0] a = 'b10110, b = 'b11011, c = 'b100100, d = 'b101001, e = 'b110111;  // binary (bits - little endian)
// actions
initial
begin : main
$display ( "Guia_0101 - Teste dess" );
$display ( "a = %8b" , a );
aux = a;
$display( "Conversão: ");
$display ( "aux = %d \n", aux );
$display ( "b = %8b" , b );
aux = b;
$display( "Conversão: ");
$display ( "aux = %d \n", aux );
$display ( "c = %8b" , c );
aux = c;
$display( "Conversão: ");
$display ( "aux = %d \n", aux );
$display ( "d = %8b" , d );
aux = d;
$display( "Conversão: ");
$display ( "aux = %d \n", aux );
$display ( "e = %8b" , e );
aux = e;
$display( "Conversão: ");
$display ( "aux = %d \n", aux );
end // main
endmodule // Guia_0102