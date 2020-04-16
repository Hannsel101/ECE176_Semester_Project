module TESTBENCH();

	reg [2:0] modTester;
	wire [2:0] modOutput;

	`include "modulo.v"
	assign modOutput = modulo(modTester);
	
	initial
	begin
		modTester = 5;
		#2
		modTester = 10;
		#2
		modTester = 8;
		#2
		modTester = 0;
	end









endmodule
