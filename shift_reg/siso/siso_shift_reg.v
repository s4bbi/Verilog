
module siso_shift_reg (
    input clk,
    input rst,
    input serial_in,
    output wire serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk) begin
        if (rst)
            shift_reg <= 4'b0000;
        else begin
            shift_reg[0] <= serial_in;
            shift_reg[1] <= shift_reg[0];
            shift_reg[2] <= shift_reg[1];
            shift_reg[3] <= shift_reg[2];
        end
    end

    assign serial_out = shift_reg[3];

endmodule
