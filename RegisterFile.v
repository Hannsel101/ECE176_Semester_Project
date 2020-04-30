module RegisterFile(
	input [2:0] R1, R2, R3,//Register pointers
	input [12:0] ALU_Result,//Result from the ALU arithmetic operation
	input WriteFlag,//Flag to enable a write into a register
	input Reset,//Flag to clear the contents of the registers
	output [12:0] RegData2, RegData3);//Contents of registers pointed by R2 and R3
	
	reg [12:0] Registers [0:7];
	
	//Pass out the data for Registers 2 and 3 for ALU
	assign RegData2 = Registers[R2];
	assign RegData3 = Registers[R3];
	
	
	always@(WriteFlag or Reset)
	begin
		if(Reset)
		begin
			Registers[0] <= 0;
			Registers[1] <= 0;
			Registers[2] <= 0;
			Registers[3] <= 0;
			Registers[4] <= 0;
			Registers[5] <= 0;
			Registers[6] <= 0;
			Registers[7] <= 0;
		end
		else if(WriteFlag)
		begin
			Registers[R1] <= ALU_Result;
		end
	end
	
endmodule
