//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Terence Tan
// Date: 8 June 2021
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	// Parameters
	parameter CLK_PERIOD = 10;

	// Wires and registers
	wire heating;
	wire cooling;
	reg clk;
	reg [4:0] temperature;
	reg error;
	//initial
		//heating =0;
		//cooling =0;
//	end
	// Clock generation
	initial
	begin
		clk = 1'b0;
		forever
			# (CLK_PERIOD/2) clk=~clk;
	end

	// User logic
		initial begin
			error = 0;
			temperature = 5'd24;
				forever
					# (CLK_PERIOD*2) temperature =~temperature;
			//heating <= 1;
			//cooling<=0;
		

		forever begin
		# (CLK_PERIOD-6)
		
		//If both heating and cooling are 'ON', which is forbidden, test failed
		if ((heating)&&(cooling)) begin
			error = 1;
			$display("***TEST FAILED! Heating and Cooling are both 'ON'!! :( ***");
		$finish;
		end
		end
		end

	// Finish test, check for success
		initial begin
			#600
			if (error==0)
				$display("***TEST PASSED! HIP HIP HOORAY!! :) ***");
			$finish;
		end

	// Instantiate counter module
		
	Air_con top(
		.clk (clk),
		.temperature (temperature),
		.heating (heating),
		.cooling (cooling)
		);

endmodule
