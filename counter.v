module counter(
	input wire clk,
	input wire resetn,
	input wire clear,
	output reg[3:0] out
);

	always @ (posedge clk or negedge resetn)
	begin
		if (~resetn)
			out <= 4'b00;
		else if(clear)
			out <= 4'b00;
		else
			out <= out + 4'b01;
	end

endmodule 