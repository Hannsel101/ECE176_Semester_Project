//module modulo();

	function [2:0] modulo;
		input [2:0] operand;
		integer i;

		begin
			for(i=0; operand > 8; i=i+1)
			begin
				operand = operand - 8;
			end
			modulo = operand;
		end
	endfunction

//endmodule
