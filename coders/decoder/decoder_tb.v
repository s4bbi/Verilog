`timescale 1ns / 1ps
`include "decoder.v"

module decoder2x4_tb;

reg [1:0] in;
wire [3:0] out;

decoder_2to4 dut (.in(in), .out(out));

initial begin

    $display("Time\tInput\tOutput");
    $monitor("%0dns\t%b\t%b", $time, in, out);

    in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;
    end

    initial begin
        $dumpfile("decoder2x4_tb.vcd");
        $dumpvars(0, decoder2x4_tb);
    end

endmodule