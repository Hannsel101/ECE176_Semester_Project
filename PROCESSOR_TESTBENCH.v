module ProcessorTB();

reg clk, reset;
	
	initial begin
		clk = 0;
		reset = 1;
		#2
		reset = 0;
		#2;
		#2;
		#2;
		#2;
		#32 $finish;
	end

	always
		#1 clk = ~clk;
		
	Processor CPU(clk, reset);
		
endmodule
