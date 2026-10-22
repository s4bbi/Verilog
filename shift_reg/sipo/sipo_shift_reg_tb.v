
`timescale 1ns / 1ps
`include "sipo_shift_reg.v"

module sipo_shift_reg_tb;

    reg clk;
    reg rst;
    reg serial_in;
    wire [3:0] parallel_out;

    sipo_shift_reg dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        serial_in = 0;

        $dumpfile("sipo_shift_reg_tb.vcd");
        $dumpvars(0, sipo_shift_reg_tb);

        $timeformat(-9, 0, " ns", 10);
        $display("Time\tSerial_In\tParallel_Out");
        $monitor("%t\t%b\t\t%b",
                 $time, serial_in, parallel_out);

        #12 rst = 0;

        #1 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #20;

        $finish;
    end

    initial begin
        $dumpfile("sipo_shift_reg_tb.vcd");
        $dumpvars(0, sipo_shift_reg_tb);
    end

endmodule
