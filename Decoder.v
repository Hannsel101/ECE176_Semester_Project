module Decoder(
	input [12:0] instruction,
	output [2:0] Opcode,//Opcode for ALU
	output [2:0] R1, R2, R3,//Registers to be accessed
	output [3:0] immediate);//Constant values for immediate instructions
	
	assign Opcode = instruction[12:10];
	assign R1 = instruction[9:7];
	assign R2 = instruction[6:4];
	assign R3 = instruction[3:1];
	assign immediate = instruction[3:0];
	
	
endmodule
