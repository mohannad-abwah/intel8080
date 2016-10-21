module intel8080(
	input wire clock,
	input wire resetn,
	input wire[7:0] data_in,
	output wire[7:0] bus,
	output wire done,
	output wire sram_chip_enablen,
	output wire sram_write_enablen,
	output wire sram_output_enablen,
	output wire sram_upper_byte,
	output wire sram_lower_byte,
	output wire[15:0] address,
	inout wire[7:0] sram_data
);

	wire rA_enable, rB_enable, rC_enable, rD_enable, rE_enable, rH_enable, rL_enable, rAdL_enable, rAdH_enable, r1_enable, r2_enable, rIR_enable, counter_clear, ALU_control;
	wire data_in_select, rA_select, rB_select, rC_select, rD_select, rE_select, rH_select, rL_select, r2_select, const_select;
	wire[7:0] rA_data, rB_data, rC_data, rD_data, rE_data, rH_data, rL_data, rAdL_data, rAdH_data, r1_data, r2_data, rIR_data, r2_in;
	wire[3:0] counter;

	assign address = {rAdH_data, rAdL_data};
	assign sram_data = bus;
	
	register8 rA	(clock, bus,		rA_enable,	resetn, rA_data);
	register8 rB	(clock, bus,		rB_enable,	resetn, rB_data);
	register8 rC	(clock, bus,		rC_enable,	resetn, rC_data);
	register8 rD	(clock, bus,		rD_enable,	resetn, rD_data);
	register8 rE	(clock, bus,		rE_enable,	resetn, rE_data);
	register8 rH	(clock, bus,		rH_enable,	resetn, rH_data);
	register8 rL	(clock, bus,		rL_enable,	resetn, rL_data);
	register8 rAdL	(clock, bus,		rAdL_enable,resetn, rAdL_data);
	register8 rAdH	(clock, bus,		rAdH_enable,resetn, rAdH_data);
	register8 r1	(clock, bus,		r1_enable,	resetn, r1_data);
	register8 r2	(clock, r2_in,		r2_enable,	resetn, r2_data);
	register8 rIR	(clock, data_in,	rIR_enable,	resetn, rIR_data);

	multiplexer mux(
		data_in,
		rA_data,
		rB_data,
		rC_data,
		rD_data,
		rE_data,
		rH_data,
		rL_data,
		r2_data,
		8'b1,
		data_in_select,
		rA_select,
		rB_select,
		rC_select,
		rD_select,
		rE_select,
		rH_select,
		rL_select,
		r2_select,
		const_select,
		bus
	);
	
	control FSM(
		rIR_data,
		counter,
		sram_chip_enablen,
		sram_write_enablen,
		sram_output_enablen,
		sram_upper_byte,
		sram_lower_byte,
		data_in_select,
		rA_select,
		rB_select,
		rC_select,
		rD_select,
		rE_select,
		rH_select,
		rL_select,
		rAdL_enable,
		rAdH_enable,
		r2_select,
		const_select,
		rA_enable,
		rB_enable,
		rC_enable,
		rD_enable,
		rE_enable,
		rH_enable,
		rL_enable,
		r1_enable,
		r2_enable,
		rIR_enable,
		ALU_control,
		counter_clear,
		done
	);
	
	arithmetic_logic_unit ALU(ALU_control, r1_data, bus, r2_in);

	counter PC(clock, resetn, counter_clear, counter);

endmodule 
	