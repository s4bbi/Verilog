`timescale 1ns / 1ps
`include "8x1.v"

module mux8x1_tb;

    reg i0, i1, i2, i3;
    reg i4, i5, i6, i7;
    reg [2:0] s;
    wire y;
    integer i;

    mux8x1 dut (
        .i0(i0), .i1(i1), .i2(i2), .i3(i3),
        .i4(i4), .i5(i5), .i6(i6), .i7(i7),
        .s(s), .y(y)
    );

    initial begin
        $dumpfile("8x1_tb.vcd");
        $dumpvars(0, mux8x1_tb);

        $display("Time\t | I0 I1 I2 I3 I4 I5 I6 I7 S | Y");
        $monitor("%g\t | %b %b %b %b %b %b %b %b | S=%b | Y=%b",
                 $time, i0, i1, i2, i3, i4, i5, i6, i7, s, y);

        // Sample data: i0 through i7 = 0,1,0,1,1,0,1,0
        {i7, i6, i5, i4, i3, i2, i1, i0} = 8'b01011010;

        for (i = 0; i < 8; i = i + 1) begin
            s = i;
            #10;
        end

        $finish;
    end

endmodule