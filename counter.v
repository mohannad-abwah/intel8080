module counter(
	input wire clk,
	input wire resetn,
	input wire clear,
	output reg[1:0] out
);

	always @ (posedge clk or negedge resetn)
	begin
		if (~resetn)
			out <= 2'b00;
		else if(clear)
			out <= 2'b00;
		else
			out <= out + 2'b01;
	end

endmodule 