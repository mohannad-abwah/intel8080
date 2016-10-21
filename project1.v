module project1(
	input wire[9:0] SW,
	input wire[3:0] KEY,
	output wire[17:0] LEDR,
	output wire[8:0] LEDG,
	output wire[6:0] HEX0,
	output wire[6:0] HEX1,
	output wire[6:0] HEX2,
	output wire[6:0] HEX3,
	output wire[6:0] HEX4,
	output wire[6:0] HEX5,
	output wire[6:0] HEX6,
	output wire[6:0] HEX7,
	output wire[15:0] SRAM_ADDR,
	output wire SRAM_WE_N,
	output wire SRAM_OE_N,
	output wire SRAM_UB_N,
	output wire SRAM_LB_N,
	output wire SRAM_CE_N,
	inout wire[7:0] SRAM_DQ
);

	assign LEDR = SW;
	assign HEX0 = 7'b1111111;
	assign HEX1 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	assign HEX3 = 7'b1111111;
	assign HEX4 = 7'b1111111;
	assign HEX5 = 7'b1111111;
	assign HEX6 = 7'b1111111;
	assign HEX7 = 7'b1111111;

	wire[7:0] data_in = SW[9] ? SRAM_DQ : SW[7:0];

	intel8080 cpu(KEY[0], KEY[3], data_in, LEDG[7:0], LEDG[8], SRAM_CE_N, SRAM_WE_N, SRAM_OE_N, SRAM_UB_N, SRAM_LB_N, SRAM_ADDR, SRAM_DQ);

endmodule 