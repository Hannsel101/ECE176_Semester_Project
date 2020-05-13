module Control(
	input clk, reset,
	input [2:0] Opcode,
	//Adding this
	input branchFlag,
	input [12:0] branchAddress,
	//Adding above
	output reg [12:0] PC,//Holds current address of current instruction
	output reg InstructionTypeSelect,//Selector for R-type/I-type mux
	output reg[2:0] ALU_Op,//Operation code sent to the ALU
	output reg WriteFlag, ReadFlag, instruction, WriteReg, ALUSTART); //Flag signalling the Registers to begin writing current ALU result
	
	reg [2:0] state;//Current state of the system
	
	
	always @(posedge clk or reset)
	begin
		if(reset)//Asynch Reset
		begin
			state <= 0;
			PC <= 0;
			InstructionTypeSelect <= 0;
			WriteFlag <= 0;
			ReadFlag <= 0;
			instruction <= 0;
			ALUSTART <= 0;
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
						casex(Opcode)//Determine output signal based on Opcode
							3'b00X: //Add or Sub
								begin
									InstructionTypeSelect <= 1;//Choose reg3 over immediate
								end
							3'b01X: //Addi or Subi
								begin
									InstructionTypeSelect <= 0;//Choose immediate over reg3
								end
							3'b100: //Branching Instructions
								begin
									InstructionTypeSelect <= 0;//Choose immediate over reg3
								end
							3'b101://BEQ
								begin
									InstructionTypeSelect <= 1;//Choose reg3
								end
							3'b11X: //Store and load immediate instructions
								begin
									InstructionTypeSelect <= 1;
								end
							default:
								begin
									InstructionTypeSelect <= 0;
								end
						endcase
						
						state <= state + 1;
					end
				3'b010://Perform arithmetic operations
					begin
						instruction <= 0;
						ReadFlag <= 0;
						ALUSTART <= 1;
						ALU_Op <= Opcode;//Send the new instruction to ALU
						state <= state + 1;
					end
				3'b011://Send the result to the appropriate location
					begin
						ALUSTART <= 0;
						casex(Opcode)//Determine where to write into based on opcode
							3'b00X: //Add or Sub
								begin
									WriteFlag <= 0;
									WriteReg <= 1;
								end
							3'b01X: //Addi or subi
								begin
									WriteFlag <= 0;
									WriteReg <= 1;
								end
							3'b10X: //br and beq
								begin
									WriteFlag <= 0;
									WriteReg <= 0;
								end
							3'b11X: //Store or load
								begin
									if(Opcode == 3'b110)//Store
									begin
										WriteFlag <= 1;
										WriteReg <= 0;
									end
									else//Load
									begin
										WriteFlag <= 0;
										WriteReg <= 1;
									end
								end
							default:
								begin
									$display("In default for Control. This should never happen!");
								end
						endcase
						
						state <= state + 1;
					end
				default: //Increment the program counter
					begin
						if(branchFlag)
						begin
							PC <= branchAddress;
						end
						else
						begin
							PC <= PC + 1;//Increment 1 address space (13 bits)
						end
						state <= 0;
						WriteFlag <= 0;
						WriteReg <= 0;
					end
			
			endcase
		end
	end
	

endmodule
