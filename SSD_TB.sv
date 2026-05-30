module seg7_tb;
reg [2:0] num = 3'b000;
wire [6:0] seg;
wire [2:0] an;
seg7 uut (
    .num(num),
    .seg(seg),
    .an(an) // Unconnected an output
);
initial begin
$monitor("Time = %0t | num = %b | seg = %b", $time, num, seg);
end
initial begin
    // Test all values from 0 to 7
    #10 num = 3'b000; // Test 0
    #10 num = 3'b001; // Test 1
    #10 num = 3'b010; // Test 2
    #10 num = 3'b011; // Test 3
    #10 num = 3'b100; // Test 4
    #10 num = 3'b101; // Test 5
    #10 num = 3'b110; // Test 6
    #10 num = 3'b111; // Test 7


    $finish; // End the simulation
end
endmoduleH