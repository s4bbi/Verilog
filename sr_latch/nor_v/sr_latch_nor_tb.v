`timescale 1ns / 1ps
`include "sr_latch_nor.v"

module sr_latch_nor_tb;
    reg S, R;
    wire Q, Qbar;

    sr_latch_nor srl (Q, Qbar, S, R);

    initial begin 
        $display("Time\tS R | Q Qbar");
        $monitor("%g\t%b %b  | %b %b", $time, S, R, Q, Qbar);   

        S = 0; R = 1; #10;
        S = 1; R = 1; #10;
        S = 1; R = 0; #10;
        S = 1; R = 1; #10;
        S = 0; R = 0; #10;
        S = 1; R = 1; #10;

        $finish;
    end

    initial begin 
        $dumpfile("sr_latch_nor_tb.vcd");
        $dumpvars(0, sr_latch_nor_tb);
    end

endmodule
