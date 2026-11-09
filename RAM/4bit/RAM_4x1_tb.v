`timescale 1ns / 1ps
`include "RAM_4x1.v"

module RAM_4x1_tb;

    reg [1:0] address;
    reg write_data;
    reg write_enable;
    reg read_enable;

    wire read_data;

    // Instantiate RAM
    RAM_4x1 uut (
        .address(address),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_enable(read_enable),
        .read_data(read_data)
    );

    initial begin

        $dumpfile("RAM_4x1_tb.vcd");
        $dumpvars(0, RAM_4x1_tb);

        $monitor("Time=%0t | WE=%b ADDR=%b WD=%b RE=%b RD=%b",
                 $time, write_enable, address,
                 write_data, read_enable, read_data);

        // Initial conditions
        address = 0;
        write_data = 0;
        write_enable = 0;
        read_enable = 0;

        // WRITE operation

        #10;
        address = 2'b00;
        write_data = 1;
        write_enable = 1;

        #10;
        address = 2'b01;
        write_data = 0;

        #10;
        address = 2'b10;
        write_data = 1;

        #10;
        address = 2'b11;
        write_data = 1;

        #10;
        write_enable = 0;

        // READ operation

        #10;
        read_enable = 1;

        address = 2'b00;

        #10;
        address = 2'b01;

        #10;
        address = 2'b10;

        #10;
        address = 2'b11;

        // Disable reading
        #10;
        read_enable = 0;

        #10;
        $finish;

    end

endmodule