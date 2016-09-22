module control(
	input wire[7:0] rIR_data,
	input wire[1:0] counter,
	output reg data_in_select,
	output reg rA_select,
	output reg rB_select,
	output reg rC_select,
	output reg rD_select,
	output reg rE_select,
	output reg rH_select,
	output reg rL_select,
	output reg r2_select,
	output reg rA_enable,
	output reg rB_enable,
	output reg rC_enable,
	output reg rD_enable,
	output reg rE_enable,
	output reg rH_enable,
	output reg rL_enable,
	output reg r1_enable,
	output reg r2_enable,
	output reg rIR_enable,
	output reg ALU_control,
	output reg counter_clear,
	output reg done
);

	always @ (*)
	begin
		data_in_select = 1'b1;
		rA_select = 1'b0;
		rB_select = 1'b0;
		rC_select = 1'b0;
		rD_select = 1'b0;
		rE_select = 1'b0;
		rH_select = 1'b0;
		rL_select = 1'b0;
		r2_select = 1'b0;
		rA_enable = 1'b0;
		rB_enable = 1'b0;
		rC_enable = 1'b0;
		rD_enable = 1'b0;
		rE_enable = 1'b0;
		rH_enable = 1'b0;
		rL_enable = 1'b0;
		r1_enable = 1'b0;
		r2_enable = 1'b0;
		ALU_control = 1'b0;
		rIR_enable = 1'b0;
		counter_clear = 1'b0;
		done = 1'b0;
	end
endmodule 