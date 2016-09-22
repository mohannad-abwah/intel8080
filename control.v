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

	parameter MOVI	= 8'b00xxx110;
	parameter MOV	= 8'b01xxxxxx;
	parameter ADD	= 8'b10000xxx;
	parameter SUB	= 8'b10010xxx;

	always @ (*)
	begin
		casex ({rIR_data, counter})
			10'b0:
			begin
				data_in_select = 1'b0;
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
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b0;
			end
			{MOVI, 2'b00}:
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
				rA_enable = rIR_data[5:3] === 3'b111;
				rB_enable = rIR_data[5:3] === 3'b000;
				rC_enable = rIR_data[5:3] === 3'b001;
				rD_enable = rIR_data[5:3] === 3'b010;
				rE_enable = rIR_data[5:3] === 3'b011;
				rH_enable = rIR_data[5:3] === 3'b100;
				rL_enable = rIR_data[5:3] === 3'b101;
				r1_enable = 1'b0;
				r2_enable = 1'b0;
				ALU_control = 1'b0;
				rIR_enable = 1'b0;
				counter_clear = 1'b0;
				done = 1'b0;
			end
			{MOVI, 2'b01}:
			begin
				data_in_select = 1'b0;
				rA_select = rIR_data[5:3] === 3'b111;
				rB_select = rIR_data[5:3] === 3'b000;
				rC_select = rIR_data[5:3] === 3'b001;
				rD_select = rIR_data[5:3] === 3'b010;
				rE_select = rIR_data[5:3] === 3'b011;
				rH_select = rIR_data[5:3] === 3'b100;
				rL_select = rIR_data[5:3] === 3'b101;
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
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{MOV, 2'b00}:
			begin
				data_in_select = 1'b0;
				rA_select = rIR_data[2:0] === 3'b111;
				rB_select = rIR_data[2:0] === 3'b000;
				rC_select = rIR_data[2:0] === 3'b001;
				rD_select = rIR_data[2:0] === 3'b010;
				rE_select = rIR_data[2:0] === 3'b011;
				rH_select = rIR_data[2:0] === 3'b100;
				rL_select = rIR_data[2:0] === 3'b101;
				r2_select = 1'b0;
				rA_enable = rIR_data[5:3] === 3'b111;
				rB_enable = rIR_data[5:3] === 3'b000;
				rC_enable = rIR_data[5:3] === 3'b001;
				rD_enable = rIR_data[5:3] === 3'b010;
				rE_enable = rIR_data[5:3] === 3'b011;
				rH_enable = rIR_data[5:3] === 3'b100;
				rL_enable = rIR_data[5:3] === 3'b101;
				r1_enable = 1'b0;
				r2_enable = 1'b0;
				ALU_control = 1'b0;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{ADD, 2'b00}:
			begin
				data_in_select = 1'b0;
				rA_select = 1'b1;
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
				r1_enable = 1'b1;
				r2_enable = 1'b0;
				ALU_control = 1'b0;
				rIR_enable = 1'b0;
				counter_clear = 1'b0;
				done = 1'b0;
			end
			{ADD, 2'b01}:
			begin
				data_in_select = 1'b0;
				rA_select = rIR_data[2:0] === 3'b111;
				rB_select = rIR_data[2:0] === 3'b000;
				rC_select = rIR_data[2:0] === 3'b001;
				rD_select = rIR_data[2:0] === 3'b010;
				rE_select = rIR_data[2:0] === 3'b011;
				rH_select = rIR_data[2:0] === 3'b100;
				rL_select = rIR_data[2:0] === 3'b101;
				r2_select = 1'b0;
				rA_enable = 1'b0;
				rB_enable = 1'b0;
				rC_enable = 1'b0;
				rD_enable = 1'b0;
				rE_enable = 1'b0;
				rH_enable = 1'b0;
				rL_enable = 1'b0;
				r1_enable = 1'b0;
				r2_enable = 1'b1;
				ALU_control = 1'b0;
				rIR_enable = 1'b0;
				counter_clear = 1'b0;
				done = 1'b0;
			end
			{ADD, 2'b10}:
			begin
				data_in_select = 1'b0;
				rA_select = 1'b0;
				rB_select = 1'b0;
				rC_select = 1'b0;
				rD_select = 1'b0;
				rE_select = 1'b0;
				rH_select = 1'b0;
				rL_select = 1'b0;
				r2_select = 1'b1;
				rA_enable = 1'b1;
				rB_enable = 1'b0;
				rC_enable = 1'b0;
				rD_enable = 1'b0;
				rE_enable = 1'b0;
				rH_enable = 1'b0;
				rL_enable = 1'b0;
				r1_enable = 1'b0;
				r2_enable = 1'b0;
				ALU_control = 1'b0;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{SUB, 2'b00}:
			begin
				data_in_select = 1'b0;
				rA_select = rIR_data[2:0] === 3'b111;
				rB_select = rIR_data[2:0] === 3'b000;
				rC_select = rIR_data[2:0] === 3'b001;
				rD_select = rIR_data[2:0] === 3'b010;
				rE_select = rIR_data[2:0] === 3'b011;
				rH_select = rIR_data[2:0] === 3'b100;
				rL_select = rIR_data[2:0] === 3'b101;
				r2_select = 1'b0;
				rA_enable = 1'b0;
				rB_enable = 1'b0;
				rC_enable = 1'b0;
				rD_enable = 1'b0;
				rE_enable = 1'b0;
				rH_enable = 1'b0;
				rL_enable = 1'b0;
				r1_enable = 1'b1;
				r2_enable = 1'b0;
				ALU_control = 1'b0;
				rIR_enable = 1'b0;
				counter_clear = 1'b0;
				done = 1'b0;
			end
			{SUB, 2'b01}:
			begin
				data_in_select = 1'b0;
				rA_select = 1'b1;
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
				r2_enable = 1'b1;
				ALU_control = 1'b1;
				rIR_enable = 1'b0;
				counter_clear = 1'b0;
				done = 1'b0;
			end
			{SUB, 2'b10}:
			begin
				data_in_select = 1'b0;
				rA_select = 1'b0;
				rB_select = 1'b0;
				rC_select = 1'b0;
				rD_select = 1'b0;
				rE_select = 1'b0;
				rH_select = 1'b0;
				rL_select = 1'b0;
				r2_select = 1'b1;
				rA_enable = 1'b1;
				rB_enable = 1'b0;
				rC_enable = 1'b0;
				rD_enable = 1'b0;
				rE_enable = 1'b0;
				rH_enable = 1'b0;
				rL_enable = 1'b0;
				r1_enable = 1'b0;
				r2_enable = 1'b0;
				ALU_control = 1'b0;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			default:
			begin
				data_in_select = 1'b0;
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
		endcase
	end
endmodule 