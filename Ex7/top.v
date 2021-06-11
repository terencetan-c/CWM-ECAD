//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Terence Tan
// Date: 10 June 2021
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lights_selector(
	
	// Inputs and outputs	
	input clk,
	input sel,
	input rst,
	input button,
	output [23:0] light
	);
	
	// Wires
	wire [23:0] rgb;
	wire [2:0] colour;
	wire out;
	
	// User logic
 	assign light = (sel==0) ? 24'hFFFFFF : rgb;


	// Instantiate modules
	LED LED1 (
		.clk_LED(clk),
		.rst_LED(rst),
		.button_LED(button),
		.colour_LED(colour)
		);

	RGB_converter RGB_converter1 (
		.clk_con(clk),
		.colour_con(colour),
		.enable_con(1),
		.rgb_con(rgb)
		);
		


endmodule

