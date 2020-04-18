module Main_Memory(
	input [12:0] address,//Address being looked up
	input [12:0] dataIn,//Data being stored
	output reg [12:0] dataOut,//Data being read
	input write, read,//Flags sent by Control
	input clk, reset,//system clock and reset
	output reg Done,
	output [3:0] immediate);//Flag to indicate it has released or stored the contents requested

	reg resetIndex;
	reg [12:0] Data [0:12]; //12x12 array of data memory
	reg [12:0] Instruction [0:12]; //12x12 array of Instruction memory
	
	
	
	always @(negedge clk or reset)
	begin
		resetIndex <= 10;
		//Async Reset
		if(reset)//Flush Memories
		begin
				Data[0] <= 0;
				Data[1] <= 0;
				Data[2] <= 0;
				Data[3] <= 0;
				Data[4] <= 0;
				Data[5] <= 0;
				Data[6] <= 0;
				Data[7] <= 0;
				Data[8] <= 0;
				Data[9] <= 0;
				Data[10] <= 0;
				Data[11] <= 0;
				Data[12] <= 0;
		end
		else//Normal Operation
		begin
			if(write)//Write into memory
			begin
				Data[address] <= dataIn;
				Done <= 1;
			end
			else if(read)
			begin
				dataOut <= Data[address];
				Done <= 1;
			end
			else
			begin
				$display("Currently used for debugging purposes");
			end
		end
	end
	
	//This makes it to where a read or write request can only be requested once every half clock cycle.
	always @(posedge clk)
		Done <= 0;
	
endmodule