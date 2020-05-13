module Processor(
	input clk, reset,
	input [12:0] instructionIn, index);
	
	//**********DATAPATH TO CONTROL WIRES**********//
	wire writeReg, DONE, branchFlag;
	wire [2:0] Opcode;
	wire [12:0] branchAddress;
	//*********************************************//
	
	//**********CONTROL TO DATAPATH WIRES**********//
	wire [12:0] PC;
	wire InstructionTypeSelect, Write, Read, instruction, ALUSTART;
	wire [2:0] ALU_Op;
	//*********************************************//

	cpuDatapath Datapath(clk, reset, Read, Write, instruction, InstructionTypeSelect, ALU_Op, PC, writeReg, Opcode, DONE, ALUSTART, branchFlag, branchAddress,instructionIn, index);
	
	Control Controller(clk, reset, Opcode, branchFlag, branchAddress,PC, InstructionTypeSelect, ALU_Op, Write, Read, instruction, writeReg, ALUSTART);


endmodule
