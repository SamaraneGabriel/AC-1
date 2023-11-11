module ram_1x4(
    input clk,         // Clock signal
    input rst,         // Reset signal
    input r_w,         // Read/Write control signal, 0 for read and 1 for write
    input [3:0] data_in,  // 4-bit data input
    output reg [3:0] data_out // 4-bit data output
);

reg [3:0] jk_ff; // 4-bit register to store the data using JK flip-flops


//Code to write in memory if r_w == 1 and clk is on posedge
	
always @(posedge clk or posedge rst) begin
    if (rst) begin
        jk_ff <= 4'b0;
    end else if (r_w) begin
        jk_ff <= data_in;
    end
end


//Code to read from memory if r_w == 0 and clk is on negedge

always @(negedge clk) begin
	if(!r_w) begin
		data_out <= jk_ff; //Extracting data from memory
	end
end

endmodule

module ram_1x8(
    input clk,
    input rst,
    input r_w,
    input [7:0] data_in,
    input addrs,
    output [7:0] data_out
);

    wire [3:0] data_out_lower;
    wire [3:0] data_out_upper;

    // Instancia o primeiro módulo ram_1x4 para os LSBs
    
	    ram_1x4 ram_lower(
	        .clk(clk),
	        .rst(rst),
	        .r_w(r_w),
	        .data_in(data_in[3:0]), // Envia os 4 bits menos significativos
	        .data_out(data_out_lower)
	    );

	    // Instancia o segundo módulo ram_1x4 para os MSBs
	    ram_1x4 ram_upper(
	        .clk(clk),
	        .rst(rst),
	        .r_w(r_w),
	        .data_in(data_in[7:4]), // Envia os 4 bits mais significativos
	        .data_out(data_out_upper)
	    );

	    // Combina as saídas dos dois módulos ram_1x4 para formar a saída de 8 bits
	    assign data_out = {data_out_upper, data_out_lower};


endmodule

module ram_4x8(
    input clk,
    input rst,
    input r_w,
    input [1:0] addrs,
    input [7:0] data_in,
    output [7:0] data_out
);

    wire [7:0] data_out0, data_out1, data_out2, data_out3;
    wire en0, en1, en2, en3;

    // Decodificação do endereço para habilitar o módulo de RAM correto
    assign en0 = (addrs == 2'b00) & r_w;
    assign en1 = (addrs == 2'b01) & r_w;
    assign en2 = (addrs == 2'b10) & r_w;
    assign en3 = (addrs == 2'b11) & r_w;

    // Instâncias dos módulos de RAM individuais
    ram_1x8 ram00(
        .clk(clk),
        .rst(rst),
        .r_w(en0), // Habilita escrita/leitura apenas quando addrs é 00
        .data_in(data_in),
        .data_out(data_out0)
    );

    ram_1x8 ram01(
        .clk(clk),
        .rst(rst),
        .r_w(en1), // Habilita escrita/leitura apenas quando addrs é 01
        .data_in(data_in),
        .data_out(data_out1)
    );

    ram_1x8 ram10(
        .clk(clk),
        .rst(rst),
        .r_w(en2), // Habilita escrita/leitura apenas quando addrs é 10
        .data_in(data_in),
        .data_out(data_out2)
    );

    ram_1x8 ram11(
        .clk(clk),
        .rst(rst),
        .r_w(en3), // Habilita escrita/leitura apenas quando addrs é 11
        .data_in(data_in),
        .data_out(data_out3)
    );

    // Lógica para selecionar qual saída de dados usar baseada no endereço
    assign data_out = (addrs == 2'b00) ? data_out0 :
                      (addrs == 2'b01) ? data_out1 :
                      (addrs == 2'b10) ? data_out2 :
                      data_out3;

endmodule



module ram_4x8_tb; 

    // Declaração de sinais para conectar ao módulo de RAM.
    reg clk;
    reg rst;
    reg r_w;
    reg [1:0] addrs;
    reg [7:0] data_in;
    wire [7:0] data_out;
	
    ram_4x8 teste ( 
        .clk(clk),
        .rst(rst),
        .r_w(r_w),
        .data_in(data_in),
        .addrs(addrs),
        .data_out(data_out)
    );

    // Geração do sinal de clock.
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Procedimento de teste.
    initial begin
        // Inicializa os sinais.
        rst = 1; r_w = 0; data_in = 8'b0; addrs = 2'b0;
        #10; // Aguarda por 10ns.

        rst = 0; // Tira o reset.
        r_w = 1; // Define o modo para escrita.
        data_in = 8'b10101010; // Valor a ser escrito na memória.
  		addrs = 2'b0;
        #10; // Aguarda um ciclo de clock.

        r_w = 0; // Muda para o modo de leitura.
        #10; // Aguarda um ciclo de clock.

        r_w = 1;
        data_in = 8'b11111111;
        addrs =2'b01;
        #10;

        r_w = 0;
        #10;

		r_w = 1;
		data_in = 8'b10101010;
		addrs = 2'b10;
		#10;

		r_w = 0;
		#10;

		r_w = 1;
		data_in = 8'b00000001;
		addrs = 2'b11;
		#10;

		r_w = 0;
		#10;

        
        // Finaliza a simulação.
        $finish;
    end

    // Adicionar aqui monitoramento de sinais, se necessário.
    initial begin
        $monitor("At time %t, on address %b, data_out = %b", $time, addrs, data_out);
    end

endmodule


