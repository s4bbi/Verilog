`timescale 1ns / 1ps
`include "4x1.v"

module mux4x1_tb;

    reg i0, i1, i2, i3;
    reg [1:0] s;
    wire y;
    integer i;

    mux4x1 dut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s(s),
        .y(y)
    );

    initial begin
        $display("Time\t| I0 I1 I2 I3 S | Y");
        $monitor("%g\t | %b %b %b %b %b | %b",
                  $time, i0, i1, i2, i3, s, y);

        for (i = 0; i < 16; i = i + 1) begin
            {i0, i1, i2, i3, s} = {i[3:0], i[1:0]};
            #10;
        end

        $finish;
    end

    initial begin
        $dumpfile("4x1_tb.vcd");
        $dumpvars(0, mux4x1_tb);
    end

endmodule