/*
Guia_0102b.v
Gabriel Samarane Ribeiro
*/
module Guia_0102b;
// define data 
reg[7:0] a = 'b10110, b = 'b11011, c = 'b100100, d = 'b101001, e = 'b110111;  // binary (bits - little endian)

function integer bin2dec;
    input [7:0] bin;
    integer x;
    integer i;
    begin
    x = 0;
    for(i = 0; i < 8; i = i + 1) begin
        x = x + bin[i]*(2**i);
        end
    bin2dec = x;
    end
endfunction
// actions
initial
begin : main
$display ( "Guia_0101b - Teste" );
$display ( "a = %b " , a );
$display( "Conversão: %d \n", bin2dec(a));
$display ( "b = %b " , b  );
$display( "Conversão: %d \n", bin2dec(b));
$display ( "c = %b " , c );
$display( "Conversão: %d \n", bin2dec(c));
$display ( "d = %b ", d);
$display( "Conversão: %d \n", bin2dec(d));
$display ( "e = %b " , e );
$display( "Conversão: %d \n", bin2dec(e));
end // main
endmodule // Guia_0102b