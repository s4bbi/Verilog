module mux4x1 (
    input  i0,
    input  i1,
    input  i2,
    input  i3,
    input  [1:0] s,
    output y
);

    wire y0, y1;

    mux2x1 mux0 (
        .i0(i0),
        .i1(i1),
        .s(s[0]),
        .y(y0)
    );

    mux2x1 mux1 (
        .i0(i2),
        .i1(i3),
        .s(s[0]),
        .y(y1)
    );

    mux2x1 mux2 (
        .i0(y0),
        .i1(y1),
        .s(s[1]),
        .y(y)
    );

endmodule