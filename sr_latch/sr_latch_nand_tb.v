`timescale 1ns / 1ps
`include "sr_latch_nand.v"

module sr_latch_nand_tb;
    reg Sbar, Rbar;
    wire Q, Qbar;

    sr_latch_nand srl (Q, Qbar, Sbar, Rbar);

    initial begin 
        $display("Time\tSbar Rbar | Q Qbar");
        $monitor("%g\t%b %b  | %b %b", $time, Sbar, Rbar, Q, Qbar);   

        Sbar = 0; Rbar = 1; #10;
        Sbar = 1; Rbar = 1; #10;
        Sbar = 1; Rbar = 0; #10;
        Sbar = 1; Rbar = 1; #10;
        Sbar = 0; Rbar = 0; #10;
        Sbar = 1; Rbar = 1; #10;

        $finish;
    end

    initial begin 
        $dumpfile("sr_latch_nand_tb.vcd");
        $dumpvars(0, sr_latch_nand_tb);
    end

endmodule