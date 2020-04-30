//module ALU (input [12:0] a, [12:0] b, [2:0] sel, output reg [12:0] result);
module ALU(input [12:0] a, b,
			input [2:0] sel,
			output reg [12:0] result,
			input ALUSTART);
always @(ALUSTART)
begin
case(sel)//control opcode
3'b000 : result = a + b;//add
3'b001 : result = a - b;//sub
3'b010 : result = a >> b;//shift right immediate
3'b011 : result = a << b;//shif left immediate
3'b100 : result = a + b;//addi
3'b101 : result = a - b;//subi
3'b110 : result = a & b;//and
3'b111 : result = a | b;//or
default : result = 0;// not sure what the default should be
endcase
end
endmodule
