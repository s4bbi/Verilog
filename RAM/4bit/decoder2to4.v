`timescale 1ns / 1ps

module decoder2to4 (
    input wire [1:0] address,
    input wire enable,
    output reg D0, D1, D2, D3
);

    always @(*) begin
        // Default all outputs to zero
        D0 = 0;
        D1 = 0;
        D2 = 0;
        D3 = 0;

        if (enable) begin
            case (address)
                2'b00: D0 = 1;
                2'b01: D1 = 1;
                2'b10: D2 = 1;
                2'b11: D3 = 1;
            endcase
        end
    end

endmodule