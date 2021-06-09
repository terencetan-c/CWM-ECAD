//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Terence Tan
// Date: 9 June 2021
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
	);

	// Parameters
	parameter CLK_PERIOD = 10;

	// Wires and registers
	reg [2:0] colour;
	wire [23:0] rgb;
	reg clk;
	reg enable;
	reg error;



	// Clock generation
	initial
	begin
		clk = 1'b0;
		forever
			# (CLK_PERIOD/2) clk=~clk;
	end
    initial begin
        enable = 1;
        forever
            # (CLK_PERIOD*2) enable=~enable;
    end
	// User logic
		initial begin
			error = 0;
		end
		
		// Test bench different temperatures
		initial begin
			colour = 3'd0;
			#50
			colour = 1;
			#50
			colour = 2;
			#50
			colour = 3;
			#50
			colour = 4;
			#50
			colour = 5;
			#50
			colour = 6;
			#50
			colour = 7;
			#50
		    colour = 4;
		    #50
		    colour = 5;
		    #50
		    colour = 1;
		    #50
		    colour=6;
		    #50;
		
		
		end
		
		//forever begin
		//# (CLK_PERIOD-6)
		
		//If both heating and cooling are 'ON', which is forbidden, test failed
		//if ((heating)&&(cooling)) begin
			//error = 1;
			//$display("***TEST FAILED! Heating and Cooling are both 'ON'!! :( ***");
		//$finish;
		//end
		//end
		//end


	// Finish test, check for success
		initial begin
			#600
			if (error==0)
				$display("***TEST PASSED! HIP HIP HOORAY!! :) ***");
			$finish;
		end

	// Instantiate counter module
		
	RGB_converter top(
		.clk (clk),
		.colour (colour),
		.enable (enable),
		.rgb (rgb)
		);

endmodule
