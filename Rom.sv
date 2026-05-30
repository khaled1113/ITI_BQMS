module rom (

    input wire [1:0] tcount ,
    input wire [2:0] pcount ,
    output reg [4:0] wtime 

);

wire [4:0]addr = {tcount , pcount}; 

 always @(*) begin
        case (addr)
            5'b00_000: wtime = 5'd0;  5'b00_001: wtime = 5'd0;
            5'b00_010: wtime = 5'd0;  5'b00_011: wtime = 5'd0;
            5'b00_100: wtime = 5'd0;  5'b00_101: wtime = 5'd0;
            5'b00_110: wtime = 5'd0;  5'b00_111: wtime = 5'd0;
 
            5'b01_000: wtime = 5'd0;  5'b01_001: wtime = 5'd3;
            5'b01_010: wtime = 5'd6;  5'b01_011: wtime = 5'd9;
            5'b01_100: wtime = 5'd12; 5'b01_101: wtime = 5'd15;
            5'b01_110: wtime = 5'd18; 5'b01_111: wtime = 5'd21;
 
            5'b10_000: wtime = 5'd0;  5'b10_001: wtime = 5'd3;
            5'b10_010: wtime = 5'd4;  5'b10_011: wtime = 5'd6;
            5'b10_100: wtime = 5'd7;  5'b10_101: wtime = 5'd9;
            5'b10_110: wtime = 5'd10; 5'b10_111: wtime = 5'd12;
 
            5'b11_000: wtime = 5'd0;  5'b11_001: wtime = 5'd3;
            5'b11_010: wtime = 5'd4;  5'b11_011: wtime = 5'd5;
            5'b11_100: wtime = 5'd6;  5'b11_101: wtime = 5'd7;
            5'b11_110: wtime = 5'd8;  5'b11_111: wtime = 5'd9;
 
            default:   wtime = 5'd0;
        endcase
    end
 
endmodule

// ============================================================
//  ITI_BQS – Wtime ROM Lookup Table
//
//  Formula:  Wtime = floor( 3*(Pcount + Tcount - 1) / Tcount )
//            Wtime = 0  when Pcount == 0
//
//  Tcount ∈ {1, 2, 3}   Pcount ∈ {0..7}
//  Address = { tcount[1:0], pcount[2:0] }  — 5-bit, 32 entries
//
//  Pre-computed table:
//  Tcount=1: 0,3,6,9,12,15,18,21
//  Tcount=2: 0,3,4,6,7,9,10,12
//  Tcount=3: 0,3,4,5,6,7,8,9
// ============================================================