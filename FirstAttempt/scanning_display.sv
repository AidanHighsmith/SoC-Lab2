`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2025 09:16:13 PM
// Design Name: 
// Module Name: scanning_display
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


module scanning_display(
    input logic clk,
    input logic rst,
    input logic [15:0] data,
    output logic [7:0] AN,
    output logic [3:0] char
    );
    
    logic [1:0] sel;
    logic [3:0] dig;
    logic [19:0] clkdiv;
    
    
    always_ff @(posedge(rst), posedge(clk))
      if(rst)
        clkdiv<=20'd0;
      else
        clkdiv<=clkdiv+1;
    
    
    always_ff @(posedge(clkdiv[15]), posedge(rst))
      if(rst)
        sel<=2'd0;
      else
        sel<=sel+1;
        
    
    
    always_comb begin
    AN[7:4] = 4'b1111;
      case(sel)
      2'd0: begin
        dig=data[3:0];
        AN[3:0] = 4'b1110;
      end
      
      
      2'd1: begin
        dig=data[7:4];
        AN[3:0] = 4'b1101;
      end
      
      
      2'd2: begin
        dig=data[11:8];
        AN[3:0] = 4'b1011;
      end
      
      
      2'd3: begin
        dig=data[15:12];
        AN[3:0] = 4'b0111;
      end
      
      
      default: begin
        dig=4'd0;
        AN[3:0] = 4'b1111;
      end
      endcase
    end
    
    assign char=dig;
    
endmodule
