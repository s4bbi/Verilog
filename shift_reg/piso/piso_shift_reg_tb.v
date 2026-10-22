
`timescale 1ns / 1ps
`include "piso_shift_reg.v"

module piso_shift_reg_tb;

    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;

    piso_shift_reg dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        load = 0;
        parallel_in = 4'b0000;

        $dumpfile("piso_shift_reg_tb.vcd");
        $dumpvars(0, piso_shift_reg_tb);

        $timeformat(-9, 0, " ns", 10);
        $display("Time\tLoad\tParallel_In\tSerial_Out");
        $monitor("%t\t%b\t%b\t\t%b",
                 $time, load, parallel_in, serial_out);

        #12 rst = 0;

        #1 parallel_in = 4'b1011;
        load = 1;

        #10 load = 0;

        #10;
        #10;
        #10;
        #10;

        $finish;
    end

endmodule
