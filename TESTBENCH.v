module TESTBENCH();



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





endmodule
