module Guia_0204;


//dados

reg[1:0] i;
reg[1:0] j;
reg[1:0] k;

function [0:0] a;
	input reg[0:0] x;
	input reg[0:0] y;
	input reg[0:0] z;
	begin
	a = x&~(~y | ~z);
	end
endfunction

function [0:0] b;
	input reg[0:0] x;
	input reg[0:0] y;
	input reg[0:0] z;
	begin
	b = ~(~x | y)&z;
	end
endfunction

function [0:0] c;
	input reg[0:0] x;
	input reg[0:0] y;
	input reg[0:0] z;
	begin
	c = ~(~x&~y)&(~z);
	end
endfunction

function [0:0] d;
	input reg[0:0] x;
	input reg[0:0] y;
	input reg[0:0] z;
	begin
	d = ~(x&~y)&z;
	end
endfunction

function [0:0] e;
	input reg[0:0] x;
	input reg[0:0] y;
	input reg[0:0] z;
	begin
	e = (~x | y)&(~y | ~z);
	end
endfunction

initial
begin: main

$display("\na: \n");
 for(i = 0; i < 2; i = i + 1)begin
            for(j = 0; j < 2; j = j + 1)begin 
                for(k = 0; k < 2; k = k + 1) begin
                    $display("%b %b %b -> %b", i, j, k, a(i, j, k));
                end
        end
end

$display("\nb: \n");
 for(i = 0; i < 2; i = i + 1)begin
            for(j = 0; j < 2; j = j + 1)begin 
                for(k = 0; k < 2; k = k + 1) begin
                    $display("%b %b %b -> %b", i, j, k, b(i, j, k));
                end
        end
end



$display("\nc: \n");
 for(i = 0; i < 2; i = i + 1)begin
            for(j = 0; j < 2; j = j + 1)begin 
                for(k = 0; k < 2; k = k + 1) begin
                    $display("%b %b %b -> %b", i, j, k, c(i, j, k));
                end
        end
end



$display("\nd: \n");
 for(i = 0; i < 2; i = i + 1)begin
            for(j = 0; j < 2; j = j + 1)begin 
                for(k = 0; k < 2; k = k + 1) begin
                    $display("%b %b %b -> %b", i, j, k, d(i, j, k));
                end
        end
end

$display("\ne: \n");
 for(i = 0; i < 2; i = i + 1)begin
            for(j = 0; j < 2; j = j + 1)begin 
                for(k = 0; k < 2; k = k + 1) begin
                    $display("%b %b %b -> %b", i, j, k, e(i, j, k));
                end
        end
end

end
endmodule

