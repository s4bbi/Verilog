module RAM_Cell (
    input  wire write_enable,
    input  wire write_data,
    input  wire read_enable,
    output wire read_data
);

    reg memory_bit;

    // Storage
    always @(*) begin
        if (write_enable)
            memory_bit = write_data;
    end

    // Read
    assign read_data = read_enable ? memory_bit : 1'b0;

endmodule