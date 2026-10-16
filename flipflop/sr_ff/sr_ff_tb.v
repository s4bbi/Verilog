`timescale 1ns / 1ps
`include "sr_ff.v"

module sr_ff_tb;
    
    reg clk;  
    reg reset;
    reg s;
    reg r;
    wire q;

    sr_ff_sync_reset dut (
        .clk(clk),
        .reset(reset),
        .s(s),
        .r(r),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        $display("Time\tReset\tS\tR\tQ");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, reset, s, r, q);

        
        reset = 1; s = 0; r = 0; #10;
        reset = 0; s = 1; r = 0; #10;
        reset = 0; s = 0; r = 1; #10;
        reset = 0; s = 1; r = 1; #10;
        reset = 1; s = 0; r = 0; #10;

        $finish;
    end

    initial begin
        $dumpfile("sr_ff_tb.vcd");
        $dumpvars(0, sr_ff_tb);
    end

endmodule