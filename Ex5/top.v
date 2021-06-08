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
	reg heating;
	reg cooling;


	//User logic
	
	always @(posedge clk) begin
		if ((heating==0)&&(cooling==0)) begin
			if ((temperature>18)&&(temperature<22)) begin
				heating<=0;
				cooling<=0;
			end
			else if (temperature<=18) begin
				heating<=1;
				cooling<=0;
			end
			else begin
				cooling<=1;
				heating<=0;
			end
		end
		else if ((heating==1)&&(cooling==0)) begin
			cooling<=0;
			if (temperature<20) begin
				heating<=1;
				//cooling<=0;
			end
			else begin
				heating<=0;
				//cooling<=0
			end
		end
		
		else if ((heating==0)&&(cooling==1)) begin
			heating<=0;
			if (temperature>20) begin
				cooling<=1;
			end
			else begin
				cooling<=0;
			end
		end
	end
				

endmodule
		
