
`timescale 1ns / 1ps
`include "ring_counter.v"

module ring_counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the Design Under Test (DUT)
    ring_counter dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Generate a clock with a 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply reset and monitor the counter
    initial begin
        rst = 0;

        // Save waveform data
        $dumpfile("ring_counter_tb.vcd");
        $dumpvars(0, ring_counter_tb);

        // Print header once
        $display("Time\t rst\t clk\t count\t decimal");
        $display("--------------------------------------");

        // Automatically print whenever a monitored signal changes
        $monitor("%0t\t %b\t %b\t %b\t %0d",
                 $time, rst, clk, count, count);

        // Assert asynchronous reset at 2 ns
        #2 rst = 1;

        // Release reset at 12 ns
        #10 rst = 0;
        $display("Time %0t: Reset released", $time);

        // Let the ring counter complete multiple cycles
        repeat (10) @(negedge clk);

        $display("Time %0t: Simulation completed", $time);
        $finish;
    end

endmodule
