`timescale 1ns / 1ps

module decoder2to4_tb;

    reg [1:0] address;
    reg enable;

    wire D0, D1, D2, D3;

    decoder2to4 uut (
        .address(address),
        .enable(enable),
        .D0(D0),
        .D1(D1),
        .D2(D2),
        .D3(D3)
    );

    initial begin

        $dumpfile("decoder.vcd");
        $dumpvars(0, decoder2to4_tb);

        $monitor("Time=%0t EN=%b ADDR=%b | D0=%b D1=%b D2=%b D3=%b",
                 $time, enable, address, D0, D1, D2, D3);

        enable = 0;
        address = 2'b00;

        #10 enable = 1;

        #10 address = 2'b00;
        #10 address = 2'b01;
        #10 address = 2'b10;
        #10 address = 2'b11;

        #10 enable = 0;

        #10 $finish;

    end

endmodule