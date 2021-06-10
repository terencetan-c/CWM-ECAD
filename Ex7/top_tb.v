//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	// Parameters
	parameter CLK_PERIOD = 10;

	// Wires and registers
	//reg [2:0] colour;
	wire [23:0] light;
	reg clk;
	reg rst;
	reg error;
	reg button;
	reg sel;
	wire white



	// Clock generation
	initial
	begin
		clk = 1'b0;
		forever
			# (CLK_PERIOD/2) clk=~clk;
	end
    
	initial begin
		error = 0;
	end

	initial begin
		button =1;
			forever
				# (CLK_PERIOD*2) button=~button;
	end
	
	initial begin
	   sel = 1;
	       forever
	           # (CLK_PERIOD*3) sel=~sel;
	end

	initial begin
		rst = 1;
			forever
				# (CLK_PERIOD*20) rst=~rst;
	end


	// Finish test, check for success
		initial begin
			#600
			if (error==0)
				$display("***TEST PASSED! HIP HIP HOORAY!! :) ***");
			$finish;
		end


	// Instantiate counter module
		
	lights_selector top(
		.clk (clk),
		.sel (sel),
		.rst (rst),
		.button (button),
		.light(light)
		);

endmodule
