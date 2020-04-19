module Control(
	input clk, reset,
	input DoneALU,//ALU done performing arithmetic
	input [2:0] Opcode,
	output reg [12:0] PC,//Holds current address of current instruction
	output reg InstructionTypeSelect,//Selector for R-type/I-type mux
	output reg[2:0] ALU_Op,//Operation code sent to the ALU
	output reg WriteFlag, ReadFlag, instruction); //Flag signalling the Registers to begin writing current ALU result
	
	reg [2:0] state;//Current state of the system
	
	
	always @(posedge clk or reset)
	begin
		if(reset)//Asynch Reset
		begin
			state <= 0;
			PC <= 0;
			InstructionTypeSelect <= 0;
			WriteFlag <= 0;
			instruction <= 0;
		end
		else//Normal Operation
		begin
			case(state)
				3'b000://Fetch the current instruction from memory
					begin
						ReadFlag <= 1;
						instruction <= 1;
						state <= state + 1;
					end
				3'b001://Run the instruction through the decoder
					begin
						instruction <= 0;
						ReadFlag <= 0;
						
						casex(Opcode)//Determine output signal based on Opcode
							3'b00X: //Add or Sub
								begin
									InstructionTypeSelect <= 1;//Choose reg3 over immediate
								end
							3'b01X: //Addi or Subi
								begin
									InstructionTypeSelect <= 0;//Choose immediate over reg3
								end
							3'b10X: //Branching Instructions
								begin
									InstructionTypeSelect <= 0;//Choose immediate over reg3
								end
							3'b11X: //Floating Point Operation
								begin
									InstructionTypeSelect <= 1;
								end
							default:
								begin
									$display("In default for Control. This should never happen!");
								end
						endcase
						
						state <= state + 1;
					end
				3'b010://Perform arithmetic operations
					begin
						state <= state + 1;
					end
				3'b011://Send the result to the appropriate location
					begin
						state <= state + 1;
					end
				default: //Increment the program counter
					begin
						PC <= PC + 4;
						state <= 0;
					end
			
			endcase
		end
	end
	

endmodule
