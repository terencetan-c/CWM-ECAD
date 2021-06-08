//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Terence Tan
// Date: 8 June 2021
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module Air_con (
	input clk,
	input [4:0] temperature,
	output heating,
	output cooling
	);

	reg [4:0] temperature;


	//User logic
	
	always @(posedge clk) begin
		
