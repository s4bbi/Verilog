
`timescale 1ns / 1ps
`include "mod_n_counter.v"

module mod_n_counter_tb;

    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate as MOD-10
    mod_n_counter #(
        .MOD(10)
    ) dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // 10 ns clock period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0;

        $dumpfile("mod_n_counter_tb.vcd");
        $dumpvars(0, mod_n_counter_tb);

        $display("Time\t rst\t clk\t count\t decimal");
        $display("--------------------------------------");

        $monitor("%0t\t %b\t %b\t %b\t %0d",
                 $time, rst, clk, count, count);

        // Apply asynchronous reset
        #2 rst = 1;
        #10 rst = 0;

        // Observe 25 falling edges
        repeat (25) @(negedge clk);

        $display("Simulation completed at %0t", $time);
        $finish;
    end

endmodule
