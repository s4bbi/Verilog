
`timescale 1ns / 1ps
`include "jk_ff.v"

module jk_ff_tb;

    reg clk, j, k;
    wire q;

    jk_ff dut (
        .clk(clk),
        .j(j),
        .k(k),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        j = 0;
        k = 0;

        $dumpfile("jk_ff_tb.vcd");
        $dumpvars(0, jk_ff_tb);

        $display("Time\t | clk\tj\tk\tq |");
        $monitor("%g | %b %b %b %b |",
                 $time, clk, j, k, q);

        #2  j = 1; k = 0; 
        #10 j = 0; k = 0; 
        #10 j = 0; k = 1; 
        #10 j = 1; k = 1; 
        #10 j = 1; k = 1; 
        #10 j = 0; k = 0; 

        #10 $finish;
    end

endmodule
