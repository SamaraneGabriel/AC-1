/*
Guia_0104.v
Gabriel Samarane Ribeiro
725052
*/
module Guia_0104;
// define data
reg [9:0] a = 5'b10101;
reg [9:0] b=  5'b11010;
reg [9:0] c = 6'b100111;
reg [9:0] d = 6'b101001;
reg [9:0] e = 6'b101101; 
integer aux = 0; // binary (bits - little endian)
// actions
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

task binToQuar;
    input reg[9:0] bin;
    integer myArray[0:10];
    integer i,j;
    begin
        for(i = 10; i >= 0; i = i - 1) begin
            myArray[i] = bin2dec(bin[i*2 +: 2]); 
        end
        $write("Conversão (4): ");
        for(j = 2; j >= 0; j = j - 1)begin
           $write("%d", myArray[j]);
        end
    end
endtask
initial
begin : main
$display ( "Guia_0101 - Teste dess" );
$display ( "a = %b" , a );
binToQuar(a);
$display("");
$display ( "b = %b" , b );
$display( "Conversão (8): %o",b);
$display ( "c = %b" , c );
$display( "Conversão (16): %h",c);
$display ( "d = %b" , d );
$display( "Conversão (8): %o",d);
$display ( "e = %b" , e );
binToQuar(e);
end // main
endmodule // Guia_0104