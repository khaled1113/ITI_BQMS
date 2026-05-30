module updown_counter_tb;

reg clk ;
reg rst_n ;
reg up_down ;
wire [2:0] count ;

// 1. FIXED: Added the missing semicolon at the end of instantiation
updown_counter uut (
    .clk(clk),
    .rst_n(rst_n),
    .up_down(up_down),
    .count(count)
); 

initial begin
    clk = 0;
    forever #1 clk = ~clk; // Generate a clock signal with a period of 10 time units
end

//############################ Monitor ############################
initial begin
    // $monitor watches the variables and prints automatically whenever ANY of them change
    $monitor("Time = %0t | rst_n = %b | up_down = %b | count = %d (Binary: %b)", 
              $time, rst_n, up_down, count, count);
end

//############################ Test Sequence ############################
initial begin 
    // 2. FIXED: Changed 'rest_n' to 'rst_n' to match your declaration
    rst_n = 0;   //reset is on every thing is zero
    up_down = 1;  // Set to count down

    #5 rst_n = 1;   // Reset is off the system is working  
    #10 up_down = 1; // Set to count up after 50 time units
    #10 up_down = 0; // Set to count down after 50 time units


    #5 $finish;     // End the simulation
end

endmodule