module Processor(
	input clk, reset);
	
	//**********DATAPATH TO CONTROL WIRES**********//
	wire BEQ, writeFlag, DONE;
	wire [2:0] Opcode;
	wire [12:0] newPC;
	//*********************************************//
	
	//**********CONTROL TO DATAPATH WIRES**********//
	wire [12:0] PC;
	wire InstructionTypeSelect, Write, Read, instruction;
	wire [2:0] ALU_Op;
	
	//*********************************************//

	cpuDatapath Datapath(clk, reset, Read, Write, instruction, InstructionTypeSelect, ALU_Op, PC, BEQ, writeFlag, newPC, Opcode, DONE);
	
	Control Controller(clk, reset, Opcode,PC, InstructionTypeSelect, ALU_Op, Write, Read, instruction);


endmodule
