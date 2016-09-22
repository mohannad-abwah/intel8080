module arithmetic_logic_unit(
	input wire ALU_control,
	input wire[7:0] input1,
	input wire[7:0] input2,
	output wire[7:0] out
);

	assign out = ALU_control ? input2 - input1 : input1 + input2;

endmodule 