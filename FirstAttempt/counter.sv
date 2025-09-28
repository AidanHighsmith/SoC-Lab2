`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2025 12:01:23 PM
// Design Name: 
// Module Name: counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter#(parameter N=17)(
    input logic clk,
    input logic rst,
    input logic en,
    output logic tic
    );
    
    logic [N-1:0] count, ncount;
    logic en_toggle;
    
    always_ff @(posedge(clk), posedge(rst))
      if(rst)
        count<=0;
      else
        count<=ncount;
    
    always_ff @(posedge(en))
      en_toggle=1;
    
    
    always_comb begin
      if(en_toggle)
        ncount=count+1;
      else
        ncount=count;
    end
    
    assign tic = (count==1);
    
endmodule
