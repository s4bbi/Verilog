
`timescale 1ns / 1ps
`include "t_ff.v"

module t_ff_tb;

    reg clk, t;
    wire q;

    t_ff dut (
        .clk(clk),
        .t(t),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        t = 0;

        $dumpfile("t_ff_tb.vcd");
        $dumpvars(0, t_ff_tb);

        $display("Time\t | clk t q |");
        $monitor("%g | %b %b %b |",
                 $time, clk, t, q);

        #2  t = 1;  
        #20 t = 0;  
        #20 t = 1;  
        #20 $finish;
    end

endmodule
