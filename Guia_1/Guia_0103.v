/*
Guia_0103.v
Gabriel Samarane Ribeiro
725052
*/
module Guia_0102;
// define data
reg [7:0] aux = 0; 
integer a = 61, b = 54, c = 77, d = 151, e = 738;  // binary (bits - little endian)
// actions
initial
begin : main
$display ( "Guia_0101 - Teste dess" );
$display ( "a = %d" , a );
aux = a;
$display( "Conversão (8): ");
$display ( "aux = %o \n", aux );
$display ( "b = %d" , b );
aux = b;
$display( "Conversão (8): ");
$display ( "aux = %o \n", aux );
$display ( "c = %d" , c );
aux = c;
$display( "Conversão: (16)");
$display ( "aux = %h \n", aux );
$display ( "d = %d" , d );
aux = d;
$display( "Conversão: (16)");
$display ( "aux = %h \n", aux );
$display ( "e = %d" , e );
aux = e;
$display( "Conversão: (16)");
$display ( "aux = %h \n", aux );
end // main
endmodule // Guia_0103