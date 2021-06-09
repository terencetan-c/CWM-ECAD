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
	


	wire douta, rgb;
	wire enable,ena;
	wire clk,clka;
	wire colour, addra;

	assign wea = 0;
	assign dina=0;


	


	RGB_Converter your_instance_name (
  		.clka(clk),    // input wire clka
  		.ena(enable),      // input wire ena
  		.wea(wea),      // input wire [0 : 0] wea
  		.addra(colour),  // input wire [2 : 0] addra
  		.dina(dina),    // input wire [23 : 0] dina
  		.douta(rgb)  // output wire [23 : 0] douta
	);


endmodule
