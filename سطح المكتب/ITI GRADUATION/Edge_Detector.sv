module  edge_detector(
    input wire clk , 
    input wire rst , 
    input wire signal , 
    output reg out 
);

reg prev_sig ; 

always @(posedge clk  or negedge rst)begin 
    if (!rst) begin 
        out <= 1'b0;
        prev_sig <= 1'b0;
    end

    else begin 
        prev_sig <= signal ;

        out <= (!signal && prev_sig) ; 
       
    end
end


endmodule
 

// i faced problem with blocking and non blocking 
//https://nandland.com/blocking-vs-nonblocking-in-verilog/
//this link  easy explanation