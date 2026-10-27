module johnson_counter (
    input clk,
    input rst,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000; // Initialize to 0000 on reset
        else
            count <= {count[2:0], ~count[3]}; // lower 3 bits and MSB concatenated.
    end

endmodule