//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Terence Tan
// Date: 8 June 2021
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	// Parameters
	parameter CLK_PERIOD = 10;

	// Wires and registers
	wire [2:0] colour;
	reg clk;
	reg rst;
	reg button;
	reg error;

	// clock generation
	initial
	begin	
		clk = 1'b0;
		forever
			# (CLK_PERIOD/2) clk=~clk;
	end

// User logic
	initial begin
		error = 0;
	end

	initial begin
		button =1;
			forever
				# (CLK_PERIOD*2) button=~button;
	end

	initial begin
		rst = 1;
			forever
				# (CLK_PERIOD*20) rst=~rst;
	end

	//forever begin
	//# (CLK_PERIOD - 6)
	//if (colour==7) begin
		//$display("***TEST FAILED! 
// Finish test, check for success
	initial begin
		#600
		if (error==0)
			$display("***TEST PASSED! HOORAY! :) ***");
		$finish;
	end

// Instantiate counter module

	LED top(
	.clk (clk),
	.rst (rst),
	.button (button),
	.colour (colour)
	);

endmodule




