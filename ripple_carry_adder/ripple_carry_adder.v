module ripple_carry_adder (
    input [3:0] A, B,
    input Cin,
    output [3:0] S,
    output Cout
);

    wire [2:0] W;

    full_adder FA0 (.S(S[0]), .Cout(W[0]), .A(A[0]), .B(B[0]), .Cin(Cin));
    full_adder FA1 (.S(S[1]), .Cout(W[1]), .A(A[1]), .B(B[1]), .Cin(W[0]));
    full_adder FA2 (.S(S[2]), .Cout(W[2]), .A(A[2]), .B(B[2]), .Cin(W[1]));
    full_adder FA3 (.S(S[3]), .Cout(Cout), .A(A[3]), .B(B[3]), .Cin(W[2]));

endmodule
    