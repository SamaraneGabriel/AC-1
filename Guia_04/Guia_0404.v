module a (output s, input x, y, z);
    assign s = (x | y | ~z) & (x | ~y | ~z) & (~x | ~y | z) & (~x | ~y | ~z);
endmodule // PoS

module b (output s, input x, y, z);
    assign s = (x | y | z) & (x | ~y | ~z) & (~x | y | z) & (~x | y | ~z) & (~x | ~y | z);
endmodule // PoS

module c (output s, input w, x, y, z);
    assign s = (w | x | y | z) & (w | x | y | ~z) & (w | x | ~y | z) & (w | ~x | y | z) & (w | ~x | ~y | z) & (~w | x | y | z) & (~w | x | ~y | ~z) & (~w | ~x | y | ~z);
endmodule // PoS

module d (output s, input w, x, y, z);
    assign s = (w | x | y | ~z) & (w | x | ~y | z) & (w | ~x | y | ~z) & (w | ~x | ~y | z) & (~w | x | y | z) & (~w | x | ~y | z) & (~w | ~x | y | z);
endmodule // PoS

module e (output s, input w, x, y, z);
    assign s = (w | x | y | ~z) & (w | x | ~y | z) & (w | ~x | y | ~z) & (w | ~x | ~y | z) & (~w | x | y | z) & (~w | x | ~y | z) & (~w | ~x | y | z);
endmodule // PoS

module tb_main;

    reg x, y, z, w;
    wire sa, sb, sc, sd, se;

    a uuta (sa, x, y, z);
    b uutb (sb, x, y, z);
    c uutc (sc, w, x, y, z);
    d uutd (sd, w, x, y, z);
    e uute (se, w, x, y, z);

    initial begin
        tb_PoSa();
        tb_PoSb();
        tb_PoSc();
        tb_PoSd();
        tb_PoSe();
        $finish;  
    end

task tb_PoSa();
    integer i, j, k;
    begin
        $display("Iniciando Simulação para tb_PoSa...");
        for (i = 0; i <= 1; i = i + 1) begin
            for (j = 0; j <= 1; j = j + 1) begin
                for (k = 0; k <= 1; k = k + 1) begin
                    x = i; y = j; z = k;
                    #1;
                    $display("x=%b y=%b z=%b | sa=%b", x, y, z, sa);
                end
            end
        end
    end
endtask

task tb_PoSb();
    integer i, j, k;
    begin
        $display("Iniciado Simulação para tb_PoSb...");
        for (i = 0; i <= 1; i = i + 1) begin
            for (j = 0; j <= 1; j = j + 1) begin
                for (k = 0; k <= 1; k = k + 1) begin
                    x = i; y = j; z = k;
                    #1;
                    $display("x=%b y=%b z=%b | sb=%b", x, y, z, sb);
                end
            end
        end
    end
endtask

task tb_PoSc();
    integer i, j, k, p;
    begin
        $display("Iniciado Simulação para tb_PoSc...");
        for (i = 0; i <= 1; i = i + 1) begin
            for (j = 0; j <= 1; j = j + 1) begin
                for (k = 0; k <= 1; k = k + 1) begin
                    for(p = 0; p <=1; p = p + 1) begin
                        w = i; x = j; y = k; z = p;
                        #1;
                        $display("w=%b x=%b y=%b z=%b | sc=%b", w, x, y, z, sc);
                    end
                end
            end
        end 
    end
endtask

task tb_PoSd();
    integer i, j, k, p;
    begin
        $display("Iniciado Simulação para tb_PoSd...");
        for (i = 0; i <= 1; i = i + 1) begin
            for (j = 0; j <= 1; j = j + 1) begin
                for (k = 0; k <= 1; k = k + 1) begin
                    for(p = 0; p <=1; p = p + 1) begin
                        w = i; x = j; y = k; z = p;
                        #1;
                        $display("w=%b x=%b y=%b z=%b | sd=%b", w, x, y, z, sd);
                    end
                end
            end
        end
    end
endtask

task tb_PoSe();
    integer i, j, k, p;
    begin
        $display("Iniciado Simulação para tb_PoSe...");
        for (i = 0; i <= 1; i = i + 1) begin
            for (j = 0; j <= 1; j = j + 1) begin
                for (k = 0; k <= 1; k = k + 1) begin
                    for(p = 0; p <=1; p = p + 1) begin
                        w = i; x = j; y = k; z = p;
                        #1;
                        $display("w=%b x=%b y=%b z=%b | se=%b", w, x, y, z, se);
                    end
                end
            end
        end 
    end
endtask

endmodule // tb_main

