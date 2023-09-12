/*
Guia_0101.v
999999 - Xxx Yyy Zzz
*/
module Guia_0101;
// define data
integer a = 26, b = 53, c = 723, d = 312, e = 365; // decimal
reg [9:0] aux = 0; // binary (bits - little endian)
// actions
initial
begin : main
$display ( "Guia_0101 - Teste dess" );
$display ( "a = %d" , a );
aux = a;
$display( "Conversão: ");
$display ( "aux = %8b \n", aux );
$display ( "b = %d" , b );
aux = b;
$display( "Conversão: ");
$display ( "aux = %8b \n", aux );
$display ( "c = %d" , c );
aux = c;
$display( "Conversão: ");
$display ( "aux = %8b \n", aux );
$display ( "d = %d" , d );
aux = d;
$display( "Conversão: ");
$display ( "aux = %8b \n", aux );
$display ( "e = %d" , e );
aux = e;
$display( "Conversão: ");
$display ( "aux = %8b \n", aux );
end // main
endmodule // Guia_0101