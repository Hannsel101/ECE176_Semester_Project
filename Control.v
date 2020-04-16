module Control(
	input clk, reset,
	input [1:0] DoneRegFlag,//Done Reading/Writing to Registers
	input DoneALU,//ALU done performing arithmetic
	input DoneImmediate,//Memory Finished outputting Immediate value
	input [12:0] Instruction,//Current instruction pointed to by the program counter
	output reg [12:0] PC,//Holds current address of current instruction
	output reg[8:0] RegSelect,//Selects Three registers from register file to be output
	output reg InstructionTypeSelect,//Selector for R-type/I-type mux
	output reg[2:0] Opcode,//Operation code sent to the ALU
	output reg WriteFlag); //Flag signalling the Registers to begin writing current ALU result
	
	reg [2:0] state;//Current state of the system
	
	initial
	begin
		PC = 0;//initialize the PC
	end
	
	always @(posedge clk)
	begin
		case(state)
			3'b000:
				begin
				
				end
			3'b001:
				begin
				
				end
			3'b010:
				begin
				
				end
			3'b011:
				begin
				
				end
			default:
				begin
				
				end
		
		endcase
	
	end
	

endmodule
