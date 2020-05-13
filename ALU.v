module ALU(input [12:0] a, b,
			input [2:0] sel,
			output reg [12:0] result,
			input ALUSTART,
			//ADDING Instructions after this point
			output reg branchFlag);
always @(ALUSTART)
begin
case(sel)//control opcode
3'b000 : begin result = a + b; branchFlag = 0; end//add
3'b001 : begin result = a - b; branchFlag = 0; end//sub
3'b010 : begin result = a + b; branchFlag = 0; end//addi
3'b011 : begin result = a - b; branchFlag = 0; end//subi
3'b100 : begin result = a; branchFlag = 1; end//branching instruction
3'b101 : begin result = a + b; branchFlag = (a == b); end//BEQ
3'b110 : begin result = b; branchFlag = 0; end//Store Immediate
3'b111 : begin result = b; branchFlag = 0; end//load immediate
default : begin result = 0; branchFlag = 0; end
endcase
end
endmodule
