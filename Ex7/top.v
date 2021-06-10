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
	input clk,
	input sel,
	input rst,
	input button,
	input [23:0] white
	output [23:0] light
	);

	//if (sel==0) begin
		
	

	doorbell doorbell1 (
		.rgb(rgb),
		.white(24'b111111111111111111111111),
		.sel(sel),
		.light(light)
		);

	LED LED1 (
		.clk(clk),
		.rst(rst),
		.button(button),
		.colour(colour)
		);

	RGB_converter RGB_converter1 (
		.clk(clk),
		.colour(colour),
		.enable(1),
		.rgb(rgb)
		);
		

	//blk_mem_gen_1 RGB_converter (
	  //.clka(clk),    // input wire clka
	  //.ena(enable),      // input wire ena
	  //.wea(0),      // input wire [0 : 0] wea
	  //.addra(colour),  // input wire [2 : 0] addra
	  //.dina(24'b0),    // input wire [23 : 0] dina
	  //.douta(rgb)  // output wire [23 : 0] douta
	//);
endmodule

