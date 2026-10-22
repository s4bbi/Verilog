`timescale 1ns / 1ps
`include "comparator.v"

module tb_custom_compare;

    reg [3:0] a, b;
    wire equal, less_than, greater_than;

    custom_compare dut (
        .input_a(a),
        .input_b(b),
        .equal(equal),
        .less_than(less_than),
        .greater_than(greater_than)
    );

    initial begin
        $dumpfile("tb_custom_compare.vcd");
        $dumpvars(0, tb_custom_compare);

        // Test 1: a == b
        a = 4'b0000;
        b = 4'b0000;
        #10;
        $display("a=%b, b=%b | Equal=%b, Less=%b, Greater=%b",
                 a, b, equal, less_than, greater_than);

        // Test 2: a > b
        a = 4'b0101;
        b = 4'b0010;
        #10;
        $display("a=%b, b=%b | Equal=%b, Less=%b, Greater=%b",
                 a, b, equal, less_than, greater_than);

        // Test 3: a < b
        a = 4'b0010;
        b = 4'b0110;
        #10;
        $display("a=%b, b=%b | Equal=%b, Less=%b, Greater=%b",
                 a, b, equal, less_than, greater_than);

        // Test 4: a == b
        a = 4'b1111;
        b = 4'b1111;
        #10;
        $display("a=%b, b=%b | Equal=%b, Less=%b, Greater=%b",
                 a, b, equal, less_than, greater_than);

        $finish;
    end

endmodule