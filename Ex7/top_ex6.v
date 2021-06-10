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
	input clk,
	input [2:0] colour,
	input enable,
	output [23:0] rgb
	);
	


	blk_mem_gen_1 RGB_converter (
	  .clka(clk),    // input wire clka
	  .ena(enable),      // input wire ena
	  .wea(0),      // input wire [0 : 0] wea
	  .addra(colour),  // input wire [2 : 0] addra
	  .dina(24'b0),    // input wire [23 : 0] dina
	  .douta(rgb)  // output wire [23 : 0] douta
	);
endmodule
