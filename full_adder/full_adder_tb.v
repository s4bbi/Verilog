`timescale 1ns/1ns
`include "full_adder.v"

module full_adder_tb;
    reg A, B, Cin;
    wire S, Cout;

    full_adder f1 (S, Cout, A, B, Cin);

    initial begin 
        $display("Time\tA B Cin | S Cout");
        $monitor("%g\t%b %b  %b  | %b %b", $time, A, B, Cin, S, Cout);   

        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;
        $finish;
    end

    initial begin 
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);
    end

endmodule