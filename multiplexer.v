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
	input wire select_0,
	input wire select_1,
	input wire select_2,
	input wire select_3,
	input wire select_4,
	input wire select_5,
	input wire select_6,
	input wire select_7,
	input wire select_8,
	output reg[7:0] out
);

	wire[8:0] select = {select_0, select_1, select_2, select_3, select_4, select_5, select_6, select_7, select_8};

	always @ (*)
	begin
		case(select)
			9'b100000000: out = data_0;
			9'b010000000: out = data_1;
			9'b001000000: out = data_2;
			9'b000100000: out = data_3;
			9'b000010000: out = data_4;
			9'b000001000: out = data_5;
			9'b000000100: out = data_6;
			9'b000000010: out = data_7;
			9'b000000001: out = data_8;
			default: out = 8'b00000000;
		endcase
	end

endmodule 