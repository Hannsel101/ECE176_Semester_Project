module Main_Memory(
	input [12:0] address,//Address being looked up
	input [12:0] dataIn,//Data being stored
	output reg [12:0] dataOut,//Data being read
	input write, read, instruction,//Flags sent by Control
	input clk, reset,//system clock and reset
	output reg Done,//Flag to indicate it has released or stored the contents requested
	input [12:0] instructionIn, index);

	reg [12:0] Data [0:12]; //13x13 array of data memory
	reg [12:0] Instruction [0:12]; //13x13 array of Instruction memory
	
	
	
	//always @(posedge clk or reset or instruction)
	always@(posedge clk or reset or instruction or index)
	begin
		//Async Reset
		if(reset)//Flush Data
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
				Instruction[index] <= instructionIn;
		end
		else//Normal Operation
		begin
			if(write)//Write into memory
			begin
				Data[address] <= dataIn;			
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
			end
			else//Debugging purposes
			begin
				//$display("Currently used for debugging purposes");
			end
		end
	end
	
	//This makes it to where a read or write request can only be requested once every half clock cycle.
	always @(negedge clk)
		Done <= 0;
	
endmodule