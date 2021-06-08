//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Terence Tan
// Date: 7 June 2021
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;
//Todo: Regitsers and wires
	wire [7:0] counter_out;
	reg clk;
	reg err;
	reg on_off;
	reg rst;
	reg change;

//Todo: Clock generation
	initial 
	begin
		clk = 1'b0;
		forever
			# (CLK_PERIOD/2) clk=~clk;
	end
//Todo: User logic
    initial begin
	err = 0;
	end
	
	initial 
	begin
	//counter_out = 0;
	on_off = 1;
	   forever
	       # (CLK_PERIOD*2) on_off=~on_off;
	end
	
	initial
	begin
    change = 1;
	   forever
	       # (CLK_PERIOD) change=~change;
    end
    
	initial
    	begin
	rst = 1;
		forever
			# (CLK_PERIOD*4) rst=~rst;


	end
//Todo: Finish test, check for success
    initial begin
        #600
        if (err==0)
            $display("***TEST PASSED! :) ***");
        $finish;
    end
//Todo: Instantiate counter module
 	monitor top (
	.clk (clk),
	.rst (rst),
	.change (change),
	.on_off (on_off),
	.counter_out (counter_out)
	);



endmodule 
