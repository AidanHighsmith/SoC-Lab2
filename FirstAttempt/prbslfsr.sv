`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2025 10:54:26 AM
// Design Name: 
// Module Name: prbslfsr
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


module prbslfsr#(parameter N=4)(
    input logic clk,
    input logic rst,
    output logic [13:0] rnd
    );
    
    parameter START={{(N-1){1'b0}},1'b1};
    
    logic [13:0] random;
    logic cycle;
    logic [N-1:0] count, ncount;
    
    always_ff @(posedge(clk), posedge(rst))
      if(rst) begin
        count<=START;
        cycle<=0;
      end
      else begin
        count<=ncount;
        cycle=cycle+1;
      end
    
    logic feedback;
    assign feedback=count[3]^count[2];
    assign ncount={count[2:0],feedback};
    
    always_comb begin
        if(cycle<14) begin
          random[12:0] = rnd[12:0];
          rnd[13:1] = random[12:0];
          rnd[0] = count[3];
        end
    end
    
endmodule
