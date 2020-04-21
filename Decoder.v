module Decoder(
	input [12:0] instruction,
	output [2:0] Opcode,//Opcode for ALU
	output [2:0] R1, R2, R3,//Registers to be accessed
	output [3:0] immediate);//Constant values for immediate instructions
	
	assign Opcode = instruction[12:9];
	assign R1 = instruction[8:6];
	assign R2 = instruction[5:3];
	assign R3 = instruction[2:0];
	assign immediate = instruction[3:0];
	
	
endmodule
