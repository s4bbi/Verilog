`timescale 1ns / 1ps
`include "binarytogray.v"

module binarytogray_tb;

    reg  [3:0] binary;
    wire [3:0] gray;
    integer i;

    binarytogray btg (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        // Display output whenever inputs or outputs change
        $display("Time\tBinary\tGray");
        $monitor("%g\t | %b\t | %b\t",
                 $time, binary, gray);

        // Test all 16 combinations
        for (i = 0; i < 16; i = i + 1) begin
            binary = i;
            #10;
        end

        $finish;
    end

    initial begin
        // Dump waveforms for viewing in a waveform viewer
        $dumpfile("binarytogray_tb.vcd");
        $dumpvars(0, binarytogray_tb);
    end

endmodule