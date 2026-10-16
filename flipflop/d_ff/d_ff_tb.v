
`timescale 1ns / 1ps
`include "d_ff.v"

module d_ff_tb;

    reg clk;
    reg d;
    wire q;

    d_ff dut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 0;

        $display("Time\tD\tQ");
        $monitor("%0dns\t%b\t%b", $time, d, q);

        #10 d = 1;
        #10 d = 0;
        #10 d = 1;

        #10 $finish;
    end

    initial begin
        $dumpfile("d_ff_tb.vcd");
        $dumpvars(0, d_ff_tb);
    end

endmodule
