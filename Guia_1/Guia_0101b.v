/*
Guia_0101.v
999999 - Xxx Yyy Zzz
*/
module Guia_0101b;
// define data
integer a = 26, b = 53, c = 723, d = 312, e = 365; // decimal
function [9:0] dec2bin;
    input integer x;
    reg[9:0] byte;
    begin
    byte = 10'b0;
    byte = x + byte;
    dec2bin = byte;
    end
endfunction
// actions
initial
begin : main
$display ( "Guia_0101b - Teste" );
$display ( "a = %d" , a );
$display( "Conversão: %b", dec2bin(a));
$display ( "b = %d" , b );
$display( "Conversão: %b", dec2bin(b));
$display ( "c = %d" , c );
$display( "Conversão: %b", dec2bin(c));
$display ( "d = %d" , d );
$display( "Conversão: %b", dec2bin(d));
$display ( "e = %d" , e );
$display( "Conversão: %b", dec2bin(e));
end // main
endmodule // Guia_0101b