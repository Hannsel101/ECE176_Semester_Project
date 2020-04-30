module Main_Memory(
	input [12:0] address,//Address being looked up
	input [12:0] dataIn,//Data being stored
	output reg [12:0] dataOut,//Data being read
	input write, read, instruction,//Flags sent by Control
	input clk, reset,//system clock and reset
	output reg Done);//Flag to indicate it has released or stored the contents requested

	reg [12:0] Data [0:12]; //13x13 array of data memory
	reg [12:0] Instruction [0:12]; //13x13 array of Instruction memory
	
	
	
	//always @(posedge clk or reset or instruction)
	always@(*)
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
				Instruction[0] <= 13'b0000000010010;//add ans =0 r0=r1-r1
				Instruction[1] <= 13'b0010010100100; //sub ans =0 r1=r2-r2
				Instruction[2] <= 13'b1000100010001; //addi ans =1 r2=r1+1
				Instruction[3] <= 13'b1010100100001;//subi ans =0 r2 =r2-1
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
	always @(negedge clk)
		Done <= 0;
	
endmodule