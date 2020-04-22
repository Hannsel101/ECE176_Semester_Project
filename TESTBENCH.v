module TESTBENCH();

	reg clk, reset;
	
	initial begin
		clk = 0;
		reset = 1;
		#2
		reset = 0;
		#2;
		#2;
		#2;
		#2;
		#32 $finish;
	end

	always
		#1 clk = ~clk;

//---------------------------------------------
	reg [7:0] modTester;
	wire [2:0] modOutput;

	`include "modulo.v"
	assign modOutput = modulo(modTester);
	
	//Testing modulo function
	initial
	begin
		modTester = 5;
		#2
		modTester = 10;
		#2
		modTester = 8;
		#2
		modTester = 0;
		#2;
	end
//---------------------------------------------
	reg [3:0] signExtendIn;
	wire [12:0] signExtendOut;

	`include "sign_Extension.v"
	assign signExtendOut = sign_Extension(signExtendIn);
	
	//Testing Sign extension
	initial
	begin
		signExtendIn = 0;
		#2
		signExtendIn = 4;
		#2
		signExtendIn = -15;
		#2;
		signExtendIn = -256;
		#2;
	end
//---------------------------------------------
	reg [55:0] hannsel;
	initial
	begin
		hannsel = 56'h48414E4E53454C;
	end
//---------------------------------------------
	reg [12:0] address, dataIn;
	wire [12:0] dataOut;
	reg write, read, instruction;
	wire Done;

	//Testing Main_Memory (Unchached)
	initial
	begin
		#2//Wait for reset to finish
		address = 0;
		instruction = 0;
		write = 0;
		dataIn = 13'hF0F0;
		read = 1;
		#2
		read = 0;
		write = 1;
		#2
		write = 0;
		read = 1;
		#2
		instruction = 1;
	end
	Main_Memory Memory(address, dataIn, dataOut, write, read, instruction, clk, reset, Done);
//---------------------------------------------
	reg [2:0] Opcode;
	wire [12:0] PC;
	wire InstructionTypeSelect, WriteFlag, ReadFlag, instructionControl;
	wire [2:0] ALU_Op;

	//Testing Control
	initial
	begin
		#2;//Wait for reset to finish
		Opcode = 3'b00X; //Add or Sub
		#10;
		Opcode = 3'b01X;//Addi or Subi
		#10;
		Opcode = 3'b10X;//Branch
		#10;
		Opcode = 3'b11X;//Floating Point
	end
	
	Control controller(clk, reset,Opcode,PC,InstructionTypeSelect,ALU_Op,WriteFlag, ReadFlag, instructionControl);
//---------------------------------------------
	reg [12:0] instructionDecoder;
	wire [2:0] OpcodeDecoder, R1, R2, R3;
	wire [3:0] immediate;
	
	//Testing Decoder
	initial
	begin
		instructionDecoder = 13'b00X1011101110;//rtype R5, R6, R7
		#4
		instructionDecoder = 13'b01X0010101010;//itype R1, R2, 10
		#4
		instructionDecoder = 13'b10X0010101100;//branch R1, R2, R6
		#4
		instructionDecoder = 13'b11X0010010010;//floating R1, R1, R1
	end
	
	Decoder decoder(instructionDecoder,OpcodeDecoder,R1, R2, R3,immediate);
//---------------------------------------------	
	reg [2:0] R1reg, R2reg, R3reg;
	reg [12:0] ALU_Result;
	reg WriteFlagReg;
	wire [12:0] RegData2, RegData3;
	
	//Testing Register File
	initial
	begin
		R1reg = 1;
		R2reg = 2;
		R3reg = 3;
		ALU_Result = 10;
		#2
		WriteFlagReg = 1;
		#2
		WriteFlagReg = 0;
		R1reg = 2;
		#2
		WriteFlagReg = 1;
		#2
		WriteFlagReg = 0;
		R1reg = 3;
		ALU_Result = 3+3;
		#2
		WriteFlagReg = 1;
	end
	
	
	RegisterFile Registers(R1reg, R2reg, R3reg,ALU_Result,WriteFlagReg,reset,RegData2, RegData3);
//---------------------------------------------
//---------------------------------------------
//---------------------------------------------
//---------------------------------------------
//---------------------------------------------



endmodule
