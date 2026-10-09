`timescale 1ns / 1ps
`include "ripple_carry_adder.v"

module ripple_carry_adder_tb;
    reg [3:0] A, B;
    reg Cin;
    wire [3:0] S;
    wire Cout;

    ripple_carry_adder rca (.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));

    initial begin 
        $display("Time\tA B Cin | S C");
        $monitor("%g\t%b %b  %b  | %b %b", $time, A, B, Cin, S, Cout);   

        A = 4'b0000; B = 4'b1000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0010; Cin = 0; #10;
        A = 4'b0011; B = 4'b0100; Cin = 1; #10;
        A = 4'b0111; B = 4'b1000; Cin = 1; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;
        A = 4'b1010; B = 4'b0101; Cin = 0; #10;

        $finish;
    end

    initial begin 
        $dumpfile("ripple_carry_adder_tb.vcd");
        $dumpvars(0, ripple_carry_adder_tb);
    end

endmodule