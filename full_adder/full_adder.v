module full_adder (S, Cout, A, B, Cin);
    output S, Cout;
    input A, B, Cin;

    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin); 

endmodule    