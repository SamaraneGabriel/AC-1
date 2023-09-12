/*
Guia_01.v
Gabriel Samarane Ribeiro
725052
*/
module guia_0301;

// define data
reg [3:0] a = 4'b1001; // binary
reg [3:0] b = 4'b1100; // binary
reg [5:0] c = 6'b101101; // binary
reg [5:0] d = 6'b100111; // binary
reg [5:0] e = 6'b110001; // binary


task C1;
	input reg[15:0] binary;
	input integer n;
	reg[31:0] aux;
	integer i;
	begin
		for(i = 0 ; i < n; i++)begin
			if(binary[i])begin
				aux[i] = binary[i];
			end
			else begin
				aux[i] = 0;
			end
		end
		aux = ~aux;
		for(i = n-1; i >= 0; i--)begin
			$write("%b",aux[i]);
		end
		$display("\n");
	end
endtask

task C2;
	input reg[15:0] binary;
	input integer n;
	reg[31:0] aux;
	integer i;
	begin
		aux = 0;
		for(i = 0 ; i < n; i++)begin
			if(binary[i])begin
				aux[i] = binary[i];
			end
			else begin
				aux[i] = 0;
			end
		end
		aux = ~(aux) + 1;
		for(i = n-1; i >= 0; i--)begin
			$write("%b",aux[i]);
		end
		$display("\n");
	end
endtask

// actions
initial
	begin : main
		$display ( "Guia_0301 - Tests" );
		$display("a = %b",a);
		$write("C1(a) = ");
		C1(a,6);
		$display("b = %b",b);
		$write("C1(b) = ");
		C1(b,8);
		$display("c = %b",c);
		$write("C1(c) = ");
		C1(c,6);
		$display("d = %b",d);
		$write("C1(d) = ");
		C1(d,7);
		$write("C2(d) = ");
		C2(d,7);
		$display("e = %b",e);
		$write("C1(e) = ");
		C1(e,8);
		$write("C2(e) = ");
		C2(e,8);
		
	end
endmodule

