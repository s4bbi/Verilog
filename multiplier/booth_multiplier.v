
module booth_multiplier (
    input clk,
    input rst,
    input start,

    input signed [3:0] multiplicand,
    input signed [3:0] multiplier,

    output reg signed [7:0] product,
    output reg busy,
    output reg done
);

    reg signed [3:0] A;
    reg signed [3:0] M;
    reg signed [3:0] Q;

    reg Q_1;

    reg [1:0] count;

    reg signed [3:0] A_work;

    always @(posedge clk or posedge rst) begin

        if (rst) begin
            A       <= 4'b0000;
            M       <= 4'b0000;
            Q       <= 4'b0000;
            Q_1     <= 1'b0;
            count   <= 2'b00;

            product <= 8'b00000000;
            busy    <= 1'b0;
            done    <= 1'b0;
        end

        else begin

            done <= 1'b0;

            if (start && !busy) begin

                A       <= 4'b0000;
                M       <= multiplicand;
                Q       <= multiplier;
                Q_1     <= 1'b0;
                count   <= 2'b00;

                busy    <= 1'b1;

            end

            else if (busy) begin

                A_work = A;

                case ({Q[0], Q_1})

                    2'b01: A_work = A + M;

                    2'b10: A_work = A - M;

                    2'b00: A_work = A;

                    2'b11: A_work = A;

                endcase

                A   <= {A_work[3], A_work[3:1]};
                Q   <= {A_work[0], Q[3:1]};
                Q_1 <= Q[0];

                if (count == 2'd3) begin

                    product <= {
                        A_work[3],
                        A_work[3:1],
                        A_work[0],
                        Q[3:1]
                    };

                    busy <= 1'b0;
                    done <= 1'b1;

                end

                else begin
                    count <= count + 1'b1;
                end

            end

        end
    end

endmodule
