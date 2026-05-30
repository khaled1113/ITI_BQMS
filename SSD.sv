module seg7 (
    input wire [2:0] num,
    output reg [6:0] seg,
    output  [2:0] an
);
assign an = 2'b000; // Enable the first 7-segment display (assuming a common anode configuration)
//count from 0 to 7
always @(*) begin
    case (num)
        3'b000: seg = 7'b1111110; // 0
        3'b001: seg = 7'b0110000; // 1
        3'b010: seg = 7'b1101101; // 2
        3'b011: seg = 7'b1111001; // 3
        3'b100: seg = 7'b0110011; // 4
        3'b101: seg = 7'b1011011; // 5
        3'b110: seg = 7'b1011111; // 6
        3'b111: seg = 7'b1110000; // 7
        default: seg = 7'b0000000; // Default if no case matches
    endcase
end
endmodule