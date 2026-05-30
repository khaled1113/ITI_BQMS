module edge_detector_tb ; 
reg clk ; 
reg rst ; 
reg signal;
wire out ; 


//calling the module 
edge_detector uut (clk  , rst , signal , out);




// clk generation 
initial begin
    clk =0; 
    forever #1 clk = ~ clk ;
end



//monitor 
initial begin
$monitor ("Time = %0t| Signal = %b | Out  = %b | Reset = %b ",$time, signal , out , rst);
end 

//tb 
initial begin 
    rst = 0 ; 
		signal <= 0;
        #5 rst =1; 
		#15 signal <= 1;
		#20 signal <= 0;
		#15 signal <= 1;
		#10 signal <= 0;
		#20 $finish;
    
end 
endmodule

    
     