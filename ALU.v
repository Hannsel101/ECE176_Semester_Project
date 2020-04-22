module ALU(
	input [2:0] ALU_Op,
	input [12:0] ALU_IN1, ALU_IN2,
	output reg BEQ,
	output reg [12:0] ALU_Result);
	
	always@(ALU_Op)
	begin
		casex(ALU_Op)
			3'b0X0://Add or Addi
				ALU_Result = ALU_IN1 + ALU_IN2;
			3'b0X1://Sub or Subi
				ALU_Result = ALU_IN1 - ALU_IN2;
			3'b100://Branch
				ALU_Result = ALU_IN1 + ALU_IN2;
			3'b101://BEQ
				BEQ = (ALU_IN1 == ALU_IN2);
			3'b110://Floating Point
				ALU_Result = ALU_IN1 + ALU_IN2;
			3'b111://Floating Point
				ALU_Result = ALU_IN1 - ALU_IN2;
		endcase
	end



endmodule
