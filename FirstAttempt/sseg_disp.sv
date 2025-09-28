`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2025 11:16:56 AM
// Design Name: 
// Module Name: sseg_disp
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


module sseg_disp(
    //input logic [2:0] position,
    input logic [3:0] character,
    //output logic [3:0] AN,
    output logic CA,
    output logic CB,
    output logic CC,
    output logic CD,
    output logic CE,
    output logic CF,
    output logic CG
    );
    
    always_comb begin 
    
    case(character)
      4'b1010: begin //H
        CA = 1'b1;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b1;
        CE = 1'b0;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b1011: begin //I
        CA = 1'b1;
        CB = 1'b1;
        CC = 1'b1;
        CD = 1'b1;
        CE = 1'b0;
        CF = 1'b0;
        CG = 1'b1;
      end
      
      
      
      4'b0000: begin //0
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b0;
        CE = 1'b0;
        CF = 1'b0;
        CG = 1'b1;
      end
      
      
      
      4'b0001: begin //1
        CA = 1'b1;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b1;
        CE = 1'b1;
        CF = 1'b1;
        CG = 1'b1;
      end
      
      
      
      4'b0010: begin //2
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b1;
        CD = 1'b0;
        CE = 1'b0;
        CF = 1'b1;
        CG = 1'b0;
      end
      
      
      
      4'b0011: begin //3
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b0;
        CE = 1'b1;
        CF = 1'b1;
        CG = 1'b0;
      end
      
      
      
      4'b0100: begin //4
        CA = 1'b1;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b0;
        CE = 1'b1;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b0101: begin //5
        CA = 1'b0;
        CB = 1'b1;
        CC = 1'b0;
        CD = 1'b0;
        CE = 1'b1;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b0110: begin //6
        CA = 1'b0;
        CB = 1'b1;
        CC = 1'b0;
        CD = 1'b0;
        CE = 1'b0;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b0111: begin //7
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b1;
        CE = 1'b1;
        CF = 1'b1;
        CG = 1'b1;
      end
      
      
      
      4'b1000: begin //8
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b0;
        CE = 1'b0;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b1001: begin //9
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b1;
        CE = 1'b1;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b1100: begin //ERR
        CA = 1'b0;
        CB = 1'b0;
        CC = 1'b0;
        CD = 1'b1;
        CE = 1'b1;
        CF = 1'b0;
        CG = 1'b0;
      end
      
      
      
      4'b1111: begin //CLR
        CA = 1'b1;
        CB = 1'b1;
        CC = 1'b1;
        CD = 1'b1;
        CE = 1'b1;
        CF = 1'b1;
        CG = 1'b1;
        //AN[3:0]=4'b1;
      end
    endcase
    end
endmodule
