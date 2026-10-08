module adder_example (S, C, A, B);
    output S, C;
    input A, B;

    assign S = A ^ B;
    assign C = A & B;
endmodule