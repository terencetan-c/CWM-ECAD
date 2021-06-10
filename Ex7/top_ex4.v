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
	input clk,
	input rst,
	input button,
	output [2:0] colour
	);

	reg [2:0] colour;


	// User logic

	always @(posedge clk) begin
		if (rst) begin
			colour<=0;
		end
		else begin

		if (colour==0) begin
			colour <= colour + 1;
		end

		else if (colour==7) begin
			colour <= 1;
		end

		else begin
			if (colour==6) begin
				if (button) begin
					colour<=1;
				end
				else begin
				colour<=colour;
				end
			end
			else begin
				if (button) begin
					colour <=colour+1;
				end
				else begin
					colour<=colour;
				end
			end
		end
		end
	end

endmodule

				
