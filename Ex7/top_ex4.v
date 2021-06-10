//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Terence Tan
// Date: 8 June 2021
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module LED (
	input clk_LED,
	input rst_LED,
	input button_LED,
	output [2:0] colour_LED
	);

	reg [2:0] colour_LED;


	// User logic

	always @(posedge clk_LED) begin
		if (rst_LED) begin
			colour_LED<=0;
		end
		else begin

		if (colour_LED==0) begin
			colour_LED <= colour_LED + 1;
		end

		else if (colour_LED==7) begin
			colour_LED <= 1;
		end

		else begin
			if (colour_LED==6) begin
				if (button_LED) begin
					colour_LED<=1;
				end
				else begin
				colour_LED<=colour_LED;
				end
			end
			else begin
				if (button_LED) begin
					colour_LED <=colour_LED+1;
				end
				else begin
					colour_LED<=colour_LED;
				end
			end
		end
		end
	end

endmodule

				
