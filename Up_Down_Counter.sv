module updown_counter (
    input wire clk,
    input wire rst_n,
    input wire up_down,
    output reg [2:0] count
);

    // Fixed the missing space after 'always' and used a comma in the sensitivity list
    always @(posedge clk, negedge rst_n) begin
        if (!rst_n) begin // Added space before begin
            count <= 3'b000; // Reset count to 0 when rst_n is low
        end else if (up_down) begin
            count <= count + 1;
        end else begin
            count <= count - 1;
        end
    end

endmodule