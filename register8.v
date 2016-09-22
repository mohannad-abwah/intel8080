module register8(
	input wire clk,
	input wire[7:0] d,
	input wire en,
	input wire r,
	output reg[7:0] q
);

	always @ (posedge clk or negedge r)
	begin
		if (~r)
			q <= 8'b0;
		else if (en)
			q <= d;
	end

endmodule 
		