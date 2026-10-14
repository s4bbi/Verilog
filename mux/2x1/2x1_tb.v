`timescale 1ns / 1ps
`include "2x1.v"

module mux2x1_tb;

    reg i0, i1, s;
    wire y;
    integer i;

    mux2x1 dut (
        .i0(i0),
        .i1(i1),
        .s(s),
        .y(y)
    );

    initial begin
        $display("Time\t| I0 I1 S | Y");
        $monitor("%g\t | %b %b %b | %b",
                  $time, i0, i1, s, y);

        for (i = 0; i < 8; i = i + 1) begin
            {i0, i1, s} = i;
            #10;
        end

        $finish;
    end

    initial begin
        $dumpfile("2x1_tb.vcd");
        $dumpvars(0, mux2x1_tb);
    end

endmodule