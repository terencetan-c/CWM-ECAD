//////////////////////////////////////////////////////////////////////////////////
// Exercise #8  - Simple End-to-End Design
// Student Name: Terence Tan
// Date: 11 June 2021
//
//  Description: In this exercise, you need to design an air conditioning systems
//
//  inputs:
//           rst_n, clk_n, clk_p, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk_p,
    input clk_n,
    input rst_n,
    input [4:0] temperature,
    output heating,
    output cooling
     //Todo: add all other ports besides clk_n and clk_p 
   );
    

   /* clock infrastructure, do not modify */
        wire clk_ibufds;

    IBUFDS IBUFDS_sysclk (
	.I(clk_p),
	.IB(clk_n),
	.O(clk_ibufds)
);

     wire clk; //use this signal as a clock for your design
        
     BUFG bufg_clk (
	.I  (clk_ibufds),
	.O  (clk)
      );

//Add logic here

	Air_con Air_con1 (
	.clk(clk),
	.temperature(temperature),
	.heating(heating),
	.cooling(cooling)
	);
endmodule
