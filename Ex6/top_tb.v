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
		
		
		
		forever begin
		# (CLK_PERIOD-6)
		
		//If RGB and colour do not match, test failed
		if ((colour!=rgb)&&(enable==1)) begin
			error = 1;
			$display("***TEST FAILED! Colour and RGB do not match!! :( ***");
		$finish;
		end


		//If RGB does not match the corresponding colour (lookup table in mem.coe), test failed
		if ((colour==0)&&(enable==1)&&(rgb!=0)) begin
			error = 1;
			$display("***TEST FAILED! Colour(0) was not converted to the corresponding RGB(0)!! :( ***");
		$finish;
		end

		if ((colour==1)&&(enable==1)&&(rgb!=24'hFF)) begin
			error = 1;
			$display("***TEST FAILED! Colour(1) was not converted to the corresponding RGB(FF)!! :( ***");
		$finish;
		end

		if ((colour==2)&&(enable==1)&&(rgb!=24'hFF00)) begin
			error = 1;
			$display("***TEST FAILED! Colour(2) was not converted to the corresponding RGB(FF00)!! :( ***");
		$finish;
		end

		if ((colour==3)&&(enable==1)&&(rgb!=24'hFFFF)) begin
			error = 1;
			$display("***TEST FAILED! Colour(3) was not converted to the corresponding RGB(FFFF)!! :( ***");
		$finish;
		end

		if ((colour==4)&&(enable==1)&&(rgb!=24'hFF0000)) begin
			error = 1;
			$display("***TEST FAILED! Colour(4) was not converted to the corresponding RGB(FF0000)!! :( ***");
		$finish;
		end

		if ((colour==5)&&(enable==1)&&(rgb!=24'hFF00FF)) begin
			error = 1;
			$display("***TEST FAILED! Colour(5) was not converted to the corresponding RGB(FF00FF)!! :( ***");
		$finish;
		end

		if ((colour==6)&&(enable==1)&&(rgb!=24'hFFFF00)) begin
			error = 1;
			$display("***TEST FAILED! Colour(6) was not converted to the corresponding RGB(FFFF00)!! :( ***");
		$finish;
		end

		if ((colour==7)&&(enable==1)&&(rgb!=24'hFFFFFF)) begin
			error = 1;
			$display("***TEST FAILED! Colour(7) was not converted to the corresponding RGB(FFFFFF)!! :( ***");
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
		
	RGB_converter top(
		.clk (clk),
		.colour (colour),
		.enable (enable),
		.rgb (rgb)
		);

endmodule
