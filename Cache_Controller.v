module Cache_Controller(
	input clk,
	input [7:0] tag,
	input [2:0] index,
	input readFlag, writeFlag,
	output stall);

	localparam VALID = 1;
	localparam INVALID = 0;

	reg [8:0] cache_Table [0:7];//Table for searching the data.

	integer i = 0;
	initial
	begin
		for(i=0; i<8; i=i+1)
		begin
			
		end
	end

endmodule
