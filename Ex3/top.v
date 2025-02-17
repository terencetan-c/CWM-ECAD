//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name: Terence Tan
// Date: 7 June 2021
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //Todo: add ports 
	input clk,
	input rst,
	input change,
	input on_off,
	output [7:0]counter_out

    );
                    
    //Todo: add registers and wires, if needed
	reg [7:0]counter_out;
    //Todo: add user logic
      always @(posedge clk) begin
		if (rst) begin
			counter_out<=0;
		end
		else begin
			if (change) begin
				if (on_off) begin
					counter_out <= counter_out + 1;
				end
				else begin
					counter_out <= counter_out  - 1;
				end
			end
			else begin
				counter_out <= counter_out;
			end
		end
	end
					
endmodule
