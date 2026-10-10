module sr_latch_nor (Q, Qbar, S, R);
    output Q, Qbar;
    input S, R;

    nor (Q, S, Qbar);
    nor (Qbar, R, Q);

endmodule