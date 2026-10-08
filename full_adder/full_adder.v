module full_adder (S, C, A, B, Cin);
    output S, C;
    input A, B, Cin;

    assign S = A ^ B ^ Cin;
    assign C = (A & B) | (B & Cin) | (A & Cin); 

endmodule    