module Guia_0103b;

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

function [31:0] dec2bin;
    input integer x;
    reg[31:0] byte;
    begin
        byte = 32'b0;
        byte = x + byte;
        dec2bin = byte;
    end
endfunction

function [0:0] is_power_2;
    input integer number;
    reg[31:0] bin;
    integer contador;
    integer i;
    begin
        bin = dec2bin(number);
        contador = 0;
        for(i = 0; i < 31; i=i+1)begin
            if(bin[i] == 1)begin
                contador = contador + 1;
            end
        end
        if(contador == 1)begin
            is_power_2 = 1;
        end else begin
            is_power_2 = 0;
        end
    end
endfunction


task dec2base;
    input integer number;
    input integer base;
    reg [31:0] byte;
    integer i,j;
    integer myArray [0:31];
    begin
        j = 0;
        byte = dec2bin(number);
        if((base <= 32 && base >= 2)&&(is_power_2(base) == 1))begin
            if(base == 4)begin
                for(i = 0; i < 32; i = i + 1) begin
                    myArray[i] = bin2dec(byte[i*2 +: 2]);
                end
                $write("O número %d na base %d é: ", number, base);
                for(j = 2; j >= 0; j = j - 1)begin
                    $write("%d", myArray[j]);
                end
            end
            $display("");
            if(base == 8)begin
                for(i = 0; i < 32; i = i + 1) begin
                    myArray[i] = bin2dec(byte[i*3 +: 3]);
                end
                $write("O número %d na base %d é: ", number, base);
                for(j = 3; j >= 0; j = j - 1)begin
                    $write("%d", myArray[j]);
                end
            end
            $display("");
            if(base == 16)begin
                for(i = 0; i < 32; i = i + 1) begin
                    myArray[i] = bin2dec(byte[i*4 +: 4]);
                end
                 $write("O número %d na base %d é: ", number, base);
                for(j = 4; j >= 0; j = j - 1)begin
                    $write("%d", myArray[j]);
                end
            end
            $display("");
            if(base == 32)begin
                for(i = 0; i < 32; i = i + 1) begin
                    myArray[i] = bin2dec(byte[i*5 +: 5]);
                end
                $write("O número %d na base %d é: ", number, base);
                for(j = 5; j >= 0; j = j - 1)begin
                    $write("%d", myArray[j]);
                end
            end
        end
    end
endtask

initial
begin : main
    $display ( "Guia_0101b - Teste" );
    dec2base(61,4);
    dec2base(54,8);
    dec2base(77,16);
    dec2base(151,16);
    dec2base(738,16);
end // main
endmodule // Guia_0103b
