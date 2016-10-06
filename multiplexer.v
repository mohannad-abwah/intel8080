module multiplexer(
	input wire[7:0] data_0,
	input wire[7:0] data_1,
	input wire[7:0] data_2,
	input wire[7:0] data_3,
	input wire[7:0] data_4,
	input wire[7:0] data_5,
	input wire[7:0] data_6,
	input wire[7:0] data_7,
	input wire[7:0] data_8,
	input wire[7:0] data_9,
	input wire select_0,
	input wire select_1,
	input wire select_2,
	input wire select_3,
	input wire select_4,
	input wire select_5,
	input wire select_6,
	input wire select_7,
	input wire select_8,
	input wire select_9,
	output reg[7:0] out
);

	wire[9:0] select = {select_0, select_1, select_2, select_3, select_4, select_5, select_6, select_7, select_8, select_9};

	always @ (*)
	begin
		case(select)
			10'b1000000000: out = data_0;
			10'b0100000000: out = data_1;
			10'b0010000000: out = data_2;
			10'b0001000000: out = data_3;
			10'b0000100000: out = data_4;
			10'b0000010000: out = data_5;
			10'b0000001000: out = data_6;
			10'b0000000100: out = data_7;
			10'b0000000010: out = data_8;
			10'b0000000001: out = data_9;
			default: out = 8'b00000000;
		endcase
	end

endmodule 