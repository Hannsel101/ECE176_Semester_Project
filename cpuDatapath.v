module cpuDatapath(
	input clk, reset,//External clock and reset signals for synchronization
	input read, write, instruction, instructionType,
	input [2:0] ALU_Op,
	input [12:0] PC,
	output BEQ, writeFlag,
	output [12:0] newPC,
	output [2:0] Opcode,
	output memDone,
	input ALUSTART);//ADDED MEMDONE recently and also ALUSTART XXXXXXXXXXXXXXXXXXXXXX
	
	//**********MEMORY SECTION OF WIRES****************//
	wire [12:0] dataOut;
	wire [12:0] ALU_Result;//Result from ALU
	
	Main_Memory Instruction_And_Data(PC, ALU_Result, dataOut, write, read, instruction, clk, reset, memDone);
	//************************************************//
	
	//**********DECODER SECTION OF WIRES****************//
	wire [2:0] R1, R2, R3;
	wire [3:0] immediate;
	
	Decoder Instruction_Decoder(dataOut, Opcode, R1, R2, R3,immediate);
	//************************************************//
	
	//**********REGISTER SECTION OF WIRES****************//
	wire [12:0] RegData2, RegData3;
	
	RegisterFile Registers(R1, R2, R3, ALU_Result, writeFlag, reset, RegData2, RegData3);
	//************************************************//
	
	//**********INTERMEDIATE COMPONENTS****************//
	`include "sign_Extension.v"
	wire [12:0] ALU_IN2, signExtendOut;

	assign signExtendOut = sign_Extension(immediate);
	Mux_2to1  #(13) Instr_Type_Mux(signExtendOut, RegData3, instructionType, ALU_IN2);
	//*************************************************//
	
	//**********ALU SECTION OF WIRES****************//
	ALU Algo_Logic_Unit(ALU_IN2, RegData2, ALU_Op, ALU_Result, ALUSTART);
	//************************************************//
	
endmodule
