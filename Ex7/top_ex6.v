//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name: Terence Tan
// Date: 9 June 2021
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module RGB_converter(
	input clk_con,
	input [2:0] colour_con,
	input enable_con,
	output [23:0] rgb_con
	);
	


	blk_mem_gen_1 RGB_converter (
	  .clka(clk_con),    // input wire clka
	  .ena(enable_con),      // input wire ena
	  .wea(0),      // input wire [0 : 0] wea
	  .addra(colour_con),  // input wire [2 : 0] addra
	  .dina(24'b0),    // input wire [23 : 0] dina
	  .douta(rgb_con)  // output wire [23 : 0] douta
	);
endmodule
