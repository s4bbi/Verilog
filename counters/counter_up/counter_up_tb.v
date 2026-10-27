
`timescale 1ns / 1ps
`include "counter_up.v"

module counter_up_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    counter_up dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        rst = 0;

        $dumpfile("counter_up_tb.vcd");
        $dumpvars(0, counter_up_tb);

        $display("Time\tclk\trst\tcount\tdecimal");
        $monitor("%0t\t%b\t%b\t%b\t%0d",
                 $time, clk, rst, count, count);

        // Assert asynchronous reset between clock edges
        #2 rst = 1;
        #3 rst = 0;

        // Let the counter count
        #50;

        // Assert reset again while counting
        #2 rst = 1;
        #8 rst = 0;

        // Continue counting
        #40;

        $finish;
    end

endmodule
