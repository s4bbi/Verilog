
`timescale 1ns / 1ps
`include "pipo_shift_reg.v"

module pipo_shift_reg_tb;

    reg clk;
    reg rst;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo_shift_reg dut (
        .clk(clk),
        .rst(rst),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        parallel_in = 4'b0000;

        $dumpfile("pipo_shift_reg_tb.vcd");
        $dumpvars(0, pipo_shift_reg_tb);

        $timeformat(-9, 0, " ns", 10);
        $display("Time\tParallel_In\tParallel_Out");
        $monitor("%t\t%b\t\t%b",
                 $time, parallel_in, parallel_out);

        #12 rst = 0;

        #1 parallel_in = 4'b1010;
        #10 parallel_in = 4'b1100;
        #10 parallel_in = 4'b0111;
        #10;

        $finish;
    end

endmodule
