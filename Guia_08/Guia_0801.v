// -------------------------
// Guia_0800 - FULL ADDER
// Nome: Gabriel Samarane Ribeiro
// Matricula: 725052
// -------------------------
// -------------------------
// half adder
// -------------------------
	
// Definição do módulo Half Adder
    module Half_Adder(input a, input b, output sum, output carry);
        xor (sum, a, b);
        and (carry, a, b);
    endmodule
    
    // Definição do módulo Full Adder
    module Full_Adder(input a, input b, input cin, output sum, output co);
        wire s1, c1, c2;
        Half_Adder ha0(a, b, s1, c1);
        Half_Adder ha1(s1, cin, sum, c2);
        or (co, c1, c2);
    endmodule 
    
    // Módulo de teste
    module Teste;
        reg  [4:0] A;
        reg  [4:0] B;
        wire [5:0] S;
        wire [4:0] c;
    
        // Atribuindo valores
        initial begin
            A = 5'b11111;
            B = 5'b01010;
        end
    
        // Instanciação do primeiro Full Adder
        Full_Adder fa0(A[0], B[0], 1'b0, S[0], c[0]);    
    
        // Instanciação dos Full Adders restantes
        genvar i;
        generate 
            for (i = 1; i < 5; i = i + 1) begin
                Full_Adder fa(A[i], B[i], c[i-1], S[i], c[i]);
            end
        endgenerate
    
        // Atribuição do bit de carry final
        assign S[5] = c[4];
    
        // Display dos resultados
        initial begin
            $display("-------------- TESTE SOMADOR-6-BITS ------------");
            $display("A = 11111,  B = 01010");
            #1 $display("Resultado da soma A + B: %b", S);
        end
    endmodule
    
