//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Terence Tan
// Date: 10 June 2021
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
	wire [23:0] light;
	reg clk;
	reg rst;
	reg error;
	reg button;
	reg sel;




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
		button =0;
			forever
				# (CLK_PERIOD*5) button=~button;
	end
	
	initial begin
	   sel = 0;	
	           # (CLK_PERIOD*7) sel=~sel;
	end

	initial begin
		rst = 1;
		#100
		rst = 0;
			
	// Test for errors
	forever begin
		# (CLK_PERIOD-6)
		
		//If sel=0 but light is not white, test failed
		if ((light!=24'hFFFFFF)&&(sel==0)) begin
			error = 1;
			$display("***TEST FAILED! sel=0 but light is not white!! :( ***");
		$finish;
		end


		//If rst=1 and sel=1 but light is not 0, test failed
		if ((light!=0)&&(rst==1)&&(sel==1)) begin
			error = 1;
			$display("***TEST FAILED! rst=1 and sel=1 but light is not 0!! :( ***");
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
		
	lights_selector top(
		.clk (clk),
		.sel (sel),
		.rst (rst),
		.button (button),
		.light(light)
		);

endmodule
