module control(
	input wire[7:0] rIR_data,
	input wire[3:0] counter,
	output reg sram_chip_enablen,
	output reg sram_write_enablen,
	output reg sram_output_enablen,
	output reg sram_upper_byte,
	output reg sram_lower_byte,
	output reg data_in_select,
	output reg rA_select,
	output reg rB_select,
	output reg rC_select,
	output reg rD_select,
	output reg rE_select,
	output reg rH_select,
	output reg rL_select,
	output reg rAdL_enable,
	output reg rAdH_enable,
	output reg r2_select,
	output reg const_select,
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

	parameter MOVI  = 8'b00xxx110;
	parameter MOV   = 8'b01xxxxxx;
	parameter ADD   = 8'b10000xxx;
	parameter SUB   = 8'b10010xxx;
	parameter INR   = 8'b00xxx100;
	parameter DCR   = 8'b00xxx101;
	parameter LDA   = 8'b00111010;
	parameter STA   = 8'b00110010;
	parameter INR_M = 8'b00110100;
	parameter DCR_M = 8'b00110101;

	always @ (*)
	begin
		sram_chip_enablen = 1'b0;
		sram_write_enablen = 1'b1;
		sram_output_enablen = 1'b1;
		sram_upper_byte = 1'b1;
		sram_lower_byte = 1'b0;
		data_in_select = 1'b0;
		rA_select = 1'b0;
		rB_select = 1'b0;
		rC_select = 1'b0;
		rD_select = 1'b0;
		rE_select = 1'b0;
		rH_select = 1'b0;
		rL_select = 1'b0;
		rAdL_enable = 1'b0;
		rAdH_enable = 1'b0;
		r2_select = 1'b0;
		const_select = 1'b0;
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

		casex ({rIR_data, counter})
			12'b0:
			begin
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
			end
			{MOVI, 4'h0}:
			begin
				data_in_select = 1'b1;
				rA_enable = rIR_data[5:3] === 3'b111;
				rB_enable = rIR_data[5:3] === 3'b000;
				rC_enable = rIR_data[5:3] === 3'b001;
				rD_enable = rIR_data[5:3] === 3'b010;
				rE_enable = rIR_data[5:3] === 3'b011;
				rH_enable = rIR_data[5:3] === 3'b100;
				rL_enable = rIR_data[5:3] === 3'b101;
			end
			{MOVI, 4'h1}:
			begin
				rA_select = rIR_data[5:3] === 3'b111;
				rB_select = rIR_data[5:3] === 3'b000;
				rC_select = rIR_data[5:3] === 3'b001;
				rD_select = rIR_data[5:3] === 3'b010;
				rE_select = rIR_data[5:3] === 3'b011;
				rH_select = rIR_data[5:3] === 3'b100;
				rL_select = rIR_data[5:3] === 3'b101;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{MOV, 4'h0}:
			begin
				rA_select = rIR_data[2:0] === 3'b111;
				rB_select = rIR_data[2:0] === 3'b000;
				rC_select = rIR_data[2:0] === 3'b001;
				rD_select = rIR_data[2:0] === 3'b010;
				rE_select = rIR_data[2:0] === 3'b011;
				rH_select = rIR_data[2:0] === 3'b100;
				rL_select = rIR_data[2:0] === 3'b101;
				rA_enable = rIR_data[5:3] === 3'b111;
				rB_enable = rIR_data[5:3] === 3'b000;
				rC_enable = rIR_data[5:3] === 3'b001;
				rD_enable = rIR_data[5:3] === 3'b010;
				rE_enable = rIR_data[5:3] === 3'b011;
				rH_enable = rIR_data[5:3] === 3'b100;
				rL_enable = rIR_data[5:3] === 3'b101;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{ADD, 4'h0}:
			begin
				rA_select = 1'b1;
				r1_enable = 1'b1;
			end
			{ADD, 4'h1}:
			begin
				rA_select = rIR_data[2:0] === 3'b111;
				rB_select = rIR_data[2:0] === 3'b000;
				rC_select = rIR_data[2:0] === 3'b001;
				rD_select = rIR_data[2:0] === 3'b010;
				rE_select = rIR_data[2:0] === 3'b011;
				rH_select = rIR_data[2:0] === 3'b100;
				rL_select = rIR_data[2:0] === 3'b101;
				r2_enable = 1'b1;
			end
			{ADD, 4'h2}:
			begin
				r2_select = 1'b1;
				rA_enable = 1'b1;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{SUB, 4'h0}:
			begin
				rA_select = rIR_data[2:0] === 3'b111;
				rB_select = rIR_data[2:0] === 3'b000;
				rC_select = rIR_data[2:0] === 3'b001;
				rD_select = rIR_data[2:0] === 3'b010;
				rE_select = rIR_data[2:0] === 3'b011;
				rH_select = rIR_data[2:0] === 3'b100;
				rL_select = rIR_data[2:0] === 3'b101;
				r1_enable = 1'b1;
			end
			{SUB, 4'h1}:
			begin
				rA_select = 1'b1;
				r2_enable = 1'b1;
				ALU_control = 1'b1;
			end
			{SUB, 4'h2}:
			begin
				r2_select = 1'b1;
				rA_enable = 1'b1;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{STA, 4'h0},
			{LDA, 4'h0},
			{INR_M, 4'h0},
			{DCR_M, 4'h0}:
			begin
				data_in_select = 1'b1;
				rAdL_enable = 1'b1;
			end
			{STA, 4'h1},
			{LDA, 4'h1},
			{INR_M, 4'h1},
			{DCR_M, 4'h1}:
			begin
				data_in_select = 1'b1;
				rAdH_enable = 1'b1;
			end
			{STA, 4'h2}:
			begin
				rA_select = 1'b1;
				sram_write_enablen = 1'b0;
			end
			{STA, 4'h3}:
			begin
				rA_select = 1'b1;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{LDA, 4'h2}:
			begin
				data_in_select = 1'b1;
				sram_output_enablen = 1'b0;
				rA_enable = 1'b1;
			end
			{LDA, 4'h3}:
			begin
				rA_select = 1'b1;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{INR_M, 4'h2}
			{DCR_M, 4'h2},:
			begin
				const_select = 1'b1;
				r1_enable = 1'b1;
			end
			{INR_M, 4'h3}:
			begin
			   data_in_select = 1'b1;
				r2_enable = 1'b1;
				sram_output_enablen = 1'b0;
			end
			{DCR_M, 4'h3}:
			begin
				data_in_select = 1'b1;
				r2_enable = 1'b1;
				sram_output_enablen = 1'b0;
				ALU_control = 1'b1;
			end
			{INR_M, 4'h4},
			{DCR_M, 4'h4}:
			begin
				r2_select = 1'b1;
				sram_write_enablen = 1'b0;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{INR, 4'h0}:
			begin
				const_select = 1'b1;
				r1_enable = 1'b1;
			end
			{INR, 4'h1}:
			begin
				rA_select = rIR_data[5:3] === 3'b111;
				rB_select = rIR_data[5:3] === 3'b000;
				rC_select = rIR_data[5:3] === 3'b001;
				rD_select = rIR_data[5:3] === 3'b010;
				rE_select = rIR_data[5:3] === 3'b011;
				rH_select = rIR_data[5:3] === 3'b100;
				rL_select = rIR_data[5:3] === 3'b101;
				r2_enable = 1'b1;
			end
			{INR, 4'h2}:
			begin
				r2_select = 1'b1;
				rA_enable = rIR_data[5:3] === 3'b111;
				rB_enable = rIR_data[5:3] === 3'b000;
				rC_enable = rIR_data[5:3] === 3'b001;
				rD_enable = rIR_data[5:3] === 3'b010;
				rE_enable = rIR_data[5:3] === 3'b011;
				rH_enable = rIR_data[5:3] === 3'b100;
				rL_enable = rIR_data[5:3] === 3'b101;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			{DCR, 4'h0}:
			begin
				const_select = 1'b1;
				r1_enable = 1'b1;
			end
			{DCR, 4'h1}:
			begin
				rA_select = rIR_data[5:3] === 3'b111;
				rB_select = rIR_data[5:3] === 3'b000;
				rC_select = rIR_data[5:3] === 3'b001;
				rD_select = rIR_data[5:3] === 3'b010;
				rE_select = rIR_data[5:3] === 3'b011;
				rH_select = rIR_data[5:3] === 3'b100;
				rL_select = rIR_data[5:3] === 3'b101;
				r2_enable = 1'b1;
				ALU_control = 1'b1;
			end
			{DCR, 4'h2}:
			begin
				r2_select = 1'b1;
				rA_enable = rIR_data[5:3] === 3'b111;
				rB_enable = rIR_data[5:3] === 3'b000;
				rC_enable = rIR_data[5:3] === 3'b001;
				rD_enable = rIR_data[5:3] === 3'b010;
				rE_enable = rIR_data[5:3] === 3'b011;
				rH_enable = rIR_data[5:3] === 3'b100;
				rL_enable = rIR_data[5:3] === 3'b101;
				rIR_enable = 1'b1;
				counter_clear = 1'b1;
				done = 1'b1;
			end
			default:
			begin
			end
		endcase
	end
endmodule 