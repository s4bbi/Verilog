
`timescale 1ns / 1ps
`include "counter_up_down.v"

module counter_up_down_tb;

    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] count;

    // Instantiate the DUT (Design Under Test)
    counter_up_down dut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus and monitoring
    initial begin
        rst = 0;
        up_down = 1;

        // Generate waveform file
        $dumpfile("counter_up_down_tb.vcd");
        $dumpvars(0, counter_up_down_tb);

        // Print header once
        $display("Time\t rst\t up_down\t count\t decimal");
        $display("-----------------------------------------------");

        // Print whenever a monitored signal changes
        $monitor("%0t\t %b\t %b\t\t %b\t %0d",
                 $time, rst, up_down, count, count);

        // Apply asynchronous reset
        #2 rst = 1;
        #10 rst = 0;
        $display("Time %0t: Reset released", $time);

        // Count UP for 5 falling clock edges
        repeat (5) @(negedge clk);
        $display("Time %0t: Switching to DOWN mode", $time);
        up_down = 0;

        // Count DOWN for 5 falling clock edges
        repeat (5) @(negedge clk);
        $display("Time %0t: Switching to UP mode", $time);
        up_down = 1;

        // Count UP for 3 falling clock edges
        repeat (3) @(negedge clk);

        $display("Time %0t: Simulation completed", $time);
        $finish;
    end

endmodule
