module mux8x1 (
    input  i0,
    input  i1,
    input  i2,
    input  i3,
    input  i4,
    input  i5,
    input  i6,
    input  i7,
    input  [2:0] s,
    output y
);

    wire y0, y1;

    mux4x1 mux0 (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .s(s[1:0]),
        .y(y0)
    );

    mux4x1 mux1 (
        .i0(i4),
        .i1(i5),
        .i2(i6),
        .i3(i7),
        .s(s[1:0]),
        .y(y1)
    );

    mux2x1 mux2 (
        .i0(y0),
        .i1(y1),
        .s(s[2]),
        .y(y)
    );
endmodule