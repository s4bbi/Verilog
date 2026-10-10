module sr_latch_nand (Q, Qbar, Sbar, Rbar);
    output Q, Qbar;
    input Sbar, Rbar;

    nand (Q, Sbar, Qbar);
    nand (Qbar, Rbar, Q);

endmodule

