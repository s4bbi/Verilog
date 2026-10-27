module ring_counter (
    input clk,
    input rst,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0001; // Initialize to 0001 on reset
        else
            count <= {count[2:0], count[3]}; // Rotate left
    end

endmodule   