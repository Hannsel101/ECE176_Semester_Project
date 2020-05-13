module ProcessorTB();

reg clk, reset;
reg [12:0] instructions [0:12];
reg [12:0] instruction;

	initial
	begin
		instructions[0] = 13'b0100000000000;//addi r0, r0, 0
		instructions[1] = 13'b0100010010001;//addi r1, r1, 1
		instructions[2] = 13'b0100100010100;//addi r2, r1, 4
		instructions[3] = 13'b1010000100000;//BEQ r2, r0, (r2+r0)  --->  if(r2 == r0) PC = r2+r0
		instructions[4] = 13'b0000000000010;//add r0, r0, r1
		instructions[5] = 13'b1000000000011;//Branch 0x03 ---> PC = 0x03
		instructions[6] = 13'b0;//Unused
		instructions[7] = 13'b0;//Unused
		instructions[8] = 13'b0;//Unused
		instructions[9] = 13'b0;//Unused
		instructions[10] = 13'b1100010000000;//Store R1 into Data[0]
	end
	
	initial begin
		clk = 0;
		reset = 1;
		instruction = 0;
		#2
		instruction = 1;
		#2
		instruction = 2;
		#2
		instruction = 3;
		#2
		instruction = 4;
		#2
		instruction = 5;
		#2
		instruction = 6;
		#2
		instruction = 7;
		#2
		instruction = 8;
		#2
		instruction = 9;
		#2
		instruction = 10;
		#2
		reset = 0;
		#210 $finish;
	end

	always
		#1 clk = ~clk;
		
	Processor CPU(clk, reset, instructions[instruction], instruction);
		
endmodule
