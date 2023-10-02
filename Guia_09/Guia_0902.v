`include "Guia_0900.v"

module pulse_fast (output signal, input clock);
    reg signal;

    always @(clock) begin
        signal = 1'b1;
        #1 signal = 1'b0;
        #1 signal = 1'b1;
        #1 signal = 1'b0;
    end
endmodule

module pulse_slow (output signal, input clock);
    reg signal;

    always @(clock) begin
        signal = 1'b1;
        #20 signal = 1'b0;		//Será sempre 1 pois o clock tem ciclo de 12 unidades de tempo
        #20 signal = 1'b1;
        #20 signal = 1'b0;
    end
endmodule

module Guia_0902;
    wire clock;
    clock clk (clock); // Usando o módulo de clock isolado
    
    wire pulse_fast_signal, pulse_slow_signal;
    
    pulse_fast pulse_fast_inst (pulse_fast_signal, clock);
    pulse_slow pulse_slow_inst (pulse_slow_signal, clock);

    initial begin
        $dumpfile("Guia_0902.vcd");
        $dumpvars(0, clk, pulse_fast_signal, pulse_slow_signal);
        #240 $finish;
    end
endmodule
