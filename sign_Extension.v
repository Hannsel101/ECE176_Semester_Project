function [12:0] sign_Extension;

	input [3:0] dataIn;//Input to be concatenated
	
	
	//Concatenate the input's MSB 9 times to the front of the input and return
	//the result out of the function.
	begin
		sign_Extension = {{9{dataIn[3]}}, dataIn};
	end

endfunction
