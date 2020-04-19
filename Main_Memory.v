module Main_Memory(
	input [12:0] address,//Address being looked up
	input [12:0] dataIn,//Data being stored
	output reg [12:0] dataOut,//Data being read
	input write, read, instruction,//Flags sent by Control
	input clk, reset,//system clock and reset
	output reg Done);//Flag to indicate it has released or stored the contents requested

	reg [12:0] Data [0:12]; //13x13 array of data memory
	reg [12:0] Instruction [0:12]; //13x13 array of Instruction memory
	
	
	
	always @(negedge clk or reset)
	begin
		//Async Reset
		if(reset)//Flush Data
		begin
				Data[0] <= 13'h1FFF;
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
			else if(read)//Read from memories
			begin
				if(instruction)//Requesting next instruction
				begin
					dataOut <= Instruction[address];
				end
				else//Requesting Data
				begin
					dataOut <= Data[address];
				end
				Done <= 1;
			end
			else//Debugging purposes
			begin
				$display("Currently used for debugging purposes");
			end
		end
	end
	
	//This makes it to where a read or write request can only be requested once every half clock cycle.
	always @(posedge clk)
		Done <= 0;
	
endmodule