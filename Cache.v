module Cache(
	input clk,
	input [12:0] PC,
	input [12:0] writeData,
	output [12:0] readData);

	wire [1:0] OFFSET = PC[1:0];
	wire [2:0] INDEX = PC[4:2];
	wire [7:0] TAG = PC[12:5];
	reg [38:0] mainMemIn;//***Placeholder signal for compilation****//
	reg [1:0] controlBits;//***Placeholder also***//
	
	//To be created later
	//Cache Controller();

	Cache_Memory(clk, INDEX, OFFSET, controlBits, writeData, mainMemIn, readData);



endmodule
