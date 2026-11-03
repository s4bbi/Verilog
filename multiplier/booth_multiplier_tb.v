
`timescale 1ns / 1ps

`include "booth_multiplier.v"

module booth_multiplier_tb;

    reg clk;
    reg rst;
    reg start;

    reg signed [3:0] multiplicand;
    reg signed [3:0] multiplier;

    wire signed [7:0] product;
    wire busy;
    wire done;

    booth_multiplier dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .busy(busy),
        .done(done)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        rst = 0;
        start = 0;
        multiplicand = 0;
        multiplier = 0;

        $dumpfile("booth_multiplier_tb.vcd");
        $dumpvars(0, booth_multiplier_tb);

        $display("Time | M | Q | busy | done | Product");
        $monitor("%0t | %0d | %0d | %b | %b | %0d",
                 $time, multiplicand, multiplier,
                 busy, done, product);

        #2 rst = 1;
        #10 rst = 0;

        @(negedge clk);
        multiplicand = 4'sd3;
        multiplier = 4'sd2;
        start = 1;

        @(negedge clk);
        start = 0;

        wait(done);
        #1;
        $display("TEST 1 RESULT: %0d", product);

        @(negedge clk);
        multiplicand = -4'sd3;
        multiplier = 4'sd2;
        start = 1;

        @(negedge clk);
        start = 0;

        wait(done);
        #1;
        $display("TEST 2 RESULT: %0d", product);

        @(negedge clk);
        multiplicand = -4'sd3;
        multiplier = -4'sd2;
        start = 1;

        @(negedge clk);
        start = 0;

        wait(done);
        #1;
        $display("TEST 3 RESULT: %0d", product);

        @(negedge clk);
        multiplicand = 4'sd7;
        multiplier = 4'sd6;
        start = 1;

        @(negedge clk);
        start = 0;

        wait(done);
        #1;
        $display("TEST 4 RESULT: %0d", product);

        #10;
        $display("All tests completed.");
        $finish;

    end

endmodule
