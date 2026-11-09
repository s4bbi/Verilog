`timescale 1ns / 1ps
`include "RAM_cell.v"

module RAM_Cell_tb;

    reg write_enable;
    reg write_data;
    reg read_enable;
    wire read_data;

    RAM_Cell dut (
        .write_enable(write_enable),
        .write_data(write_data),
        .read_enable(read_enable),
        .read_data(read_data)
    );

    initial begin

        // Generate waveform file
        $dumpfile("RAM_Cell_tb.vcd");
        $dumpvars(0, RAM_Cell_tb);

        // Display signal changes
        $monitor("Time=%0t | WE=%b | WD=%b | RE=%b | RD=%b",
                  $time, write_enable, write_data,
                  read_enable, read_data);

        // Initial conditions
        write_enable = 0;
        write_data   = 0;
        read_enable  = 0;

        // Test 1: Write 1 into memory
        #10;
        write_enable = 1;
        write_data   = 1;
        read_enable  = 0;

        // Test 2: Disable writing; memory should hold 1
        #10;
        write_enable = 0;
        write_data   = 0;

        // Test 3: Enable reading; expect 1
        #10;
        read_enable = 1;

        // Test 4: Write 0 while reading is enabled
        #10;
        write_enable = 1;
        write_data   = 0;

        // Test 5: Disable writing; memory should hold 0
        #10;
        write_enable = 0;

        // Test 6: Disable reading; output should become 0
        #10;
        read_enable = 0;

        #10;
        $finish;

    end

endmodule