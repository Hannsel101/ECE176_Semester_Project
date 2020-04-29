module cpuDatapath(
	input clk, reset,//External clock and reset signals for synchronization
	input read, write, instruction, instructionType,
	input [2:0] ALU_Op,
	input [12:0] PC,
	output BEQ, writeFlag,
	output [12:0] newPC,
	output [2:0] Opcode);
	
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
	wire [2:0] Opcode1, R1, R2, R3;
	wire [3:0] immediate;
	
	Decoder Instruction_Decoder(dataOut, Opcode1, R1, R2, R3,immediate);
	//************************************************//
	
	//**********REGISTER SECTION OF WIRES****************//
	wire WriteFlag;
	wire [12:0] RegData2, RegData3;
	assign WriteFlag = writeFlag;
	
	wire [12:0] ALU_Result;//Result from ALU
	
	RegisterFile Registers(R1, R2, R3, ALU_Result, WriteFlag, reset, RegData2, RegData3);
	//************************************************//
	
	//**********INTERMEDIATE COMPONENTS****************//
	`include "sign_Extension.v"
	wire [12:0] ALU_IN2, signExtendOut;

	assign signExtendOut = sign_Extension(immediate);
	Mux_2to1  #(13) Instr_Type_Mux(signExtendOut, RegData3, instructionType, ALU_IN2);
	//*************************************************//
	
	//**********ALU SECTION OF WIRES****************//
	ALU Algo_Logic_Unit(ALU_IN2, RegData2, ALU_Op, ALU_Result);
	//************************************************//
	
endmodule
