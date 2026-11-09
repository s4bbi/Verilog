`timescale 1ns / 1ps

module RAM_4x1 (
    input wire [1:0] address,
    input wire write_data,
    input wire write_enable,
    input wire read_enable,
    output wire read_data
);

    // Decoder outputs
    wire D0, D1, D2, D3;

    // Individual memory cell outputs
    wire RD0, RD1, RD2, RD3;

    // 2-to-4 decoder
    decoder2to4 decoder (
        .address(address),
        .enable(write_enable),
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3)
    );

    // Four 1-bit RAM cells
    RAM_Cell cell0 (
        .write_enable(D0),
        .write_data(write_data),
        .read_enable(read_enable),
        .read_data(RD0)
    );

    RAM_Cell cell1 (
        .write_enable(D1),
        .write_data(write_data),
        .read_enable(read_enable),
        .read_data(RD1)
    );

    RAM_Cell cell2 (
        .write_enable(D2),
        .write_data(write_data),
        .read_enable(read_enable),
        .read_data(RD2)
    );

    RAM_Cell cell3 (
        .write_enable(D3),
        .write_data(write_data),
        .read_enable(read_enable),
        .read_data(RD3)
    );

    // 4-to-1 read multiplexer
    assign read_data = (address == 2'b00) ? RD0 :
                       (address == 2'b01) ? RD1 :
                       (address == 2'b10) ? RD2 :
                       (address == 2'b11) ? RD3 : 1'b0;

endmodule