module mod_n_counter #(
    parameter MOD = 10
) (
    input clk,
    input rst,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else if (count == MOD - 1)
            count <= 4'b0000;
        else
            count <= count + 1'b1;
    end

endmodule