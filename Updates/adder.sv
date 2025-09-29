`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2025 07:37:56 PM
// Design Name: 
// Module Name: adder
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


module adder#(parameter N=14)(
    input logic en,
    input logic rst,
    input logic tic,
    output logic [N-1:0] out
    );
    
    logic [N-1:0] add, nadd;
    logic en_toggle;
    
    always_ff @(posedge(rst), posedge(tic))
      if(rst)
        add<=0;
      else
        add<=nadd;
    
    always_ff @(posedge(en))
      en_toggle=1;
    
    always_comb begin
      if(en_toggle)
        nadd=add+1;
      else
        nadd=add;
    end
        
    assign out=add;
    
endmodule
