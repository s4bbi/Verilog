`timescale 1ns/1ps
`include "encoder.v"


module encoder4x2_tb;

    reg  [3:0] in;
    wire [1:0] out;

    encoder4x2 dut (
        .in(in),
        .out(out)
    );

    initial begin
       $display("Time\tInput\tOutput");
       $monitor("%0dns\t%b\t%b", $time, in, out);

        in = 4'b0000;
        #5;
        in = 4'b0010;
        #5;
        in = 4'b0100;
        #5;
        in = 4'b1000;
        #5;

        $finish;
    end

    initial begin
        $dumpfile("encoder4x2_tb.vcd");
        $dumpvars(0, encoder4x2_tb);
    end

endmodule


