module cpuDatapath(
	input clk, reset,//External clock and reset signals for synchronization
	input read, write, instruction, instructionType,
	input [2:0] ALU_Op,
	input [12:0] PC,
	output BEQ, writeFlag,
	output [12:0] newPC);
	
	//**********MEMORY SECTION OF WIRES****************//
	wire memRead, memWrite, memInstruction, memDone;
	wire [12:0] memPC, dataIn, dataOut;
	
	assign memRead = read;
	assign memWrite = write;
	assign memInstruction = instruction;
	assign memPC = PC;
	
	Main_Memory Instruction_And_Data(memPC, dataIn, dataOut, memWrite, memRead, memInstruction, clk, reset, memDone);
	//************************************************//
	
	//**********DECODER SECTION OF WIRES****************//
	wire [2:0] Opcode, R1, R2, R3;
	wire [3:0] immediate;
	
	Decoder(memInstruction, Opcode, R1, R2, R3,immediate);
	//************************************************//
	
	
	//**********MEMORY SECTION OF WIRES****************//
	//************************************************//
	
	
	//**********MEMORY SECTION OF WIRES****************//
	//************************************************//
	
	
	//**********MEMORY SECTION OF WIRES****************//
	//************************************************//
	
endmodule
