`timescale 1ns / 1ps
`include "graytobinary.v"

module graytobinary_tb;

    reg  [3:0] gray;
    wire [3:0] binary;
    integer i;

    graytobinary gtb (
        .gray(gray),
        .binary(binary)
    );

    initial begin

        $display("Time\tGray\tBinary");
        $monitor("%g\t | %b\t | %b\t",
                 $time, gray, binary);
    
        // Test all 16 possible Gray inputs
        for (i = 0; i < 16; i = i + 1) begin
            gray = i;
            #10;
        end

        $finish;
    end

    initial begin
        // Dump waveforms for viewing in a waveform viewer
        $dumpfile("graytobinary_tb.vcd");
        $dumpvars(0, graytobinary_tb);
    end

endmodule