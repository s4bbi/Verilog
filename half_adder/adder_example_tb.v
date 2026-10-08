`timescale 1ns/1ns
`include "adder_example.v"

module adder_example_tb;
    reg A, B;
    wire S, C;

    adder_example a1 (S, C, A, B);

    initial begin 
        $display("Time\tA B | S C");
        $monitor("%g\t%b %b | %b %b", $time, A, B, S, C);   

        A = 0; B = 0; #10;
        A = 0; B = 1; #10; 
        A = 1; B = 0; #10;
        A = 1; B = 1; #10; 

        $finish;
    end

    initial begin 
        $dumpfile("adder_example_tb.vcd");
        $dumpvars(0, adder_example_tb);
    end

endmodule