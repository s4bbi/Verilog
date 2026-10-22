
`timescale 1ns / 1ps
`include "siso_shift_reg.v"

module siso_shift_reg_tb;

  reg clk;
  reg rst;
  reg serial_in;
  wire serial_out;

  siso_shift_reg dut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
  );

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    serial_in = 0;

    $dumpfile("siso_shift_reg_tb.vcd");
    $dumpvars(0, siso_shift_reg_tb);

    $display("Time\tSerial_In\tSerial_Out");
    $monitor("%0t\t%b\t\t%b", $time, serial_in, serial_out);

    #2;
    #5 rst = 0;

    #1 serial_in = 1;
    #10 serial_in = 0;
    #10 serial_in = 1;
    #10 serial_in = 0;
    #20;

    $finish;
  end

endmodule
