`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2025 12:08:25 PM
// Design Name: 
// Module Name: driver
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


module driver(
    input logic clk,
    input logic BTNC,
    input logic BTNU,
    input logic BTNL,
    output logic [1:0] LED,
    output logic [7:0] AN,
    output logic CA,
    output logic CB,
    output logic CC,
    output logic CD,
    output logic CE,
    output logic CF,
    output logic CG
    );
    
    //state parameters
    parameter INIT=2'b00;
    parameter BUFF=2'b01;
    parameter TEST=2'b10;
    parameter DISP=2'b11;
    
    //sseg display parameters
    parameter HI=16'b0000_0000_1010_1011;
    parameter ERR=16'b1100_1100_1100_1100;
    parameter CLR=16'b1111111111111111;
    
    //intermediate wires
    wire tic, rtic;
    logic [15:0] data;
    logic timer_start;
    logic [13:0] rcnt, rnd;
    logic [13:0] cnt, timer;
    logic [3:0] char;
    //logic [2:0] pos;
    logic [1:0] state, nstate;
    
    //reaction counter
    counter #(.N(17)) react1(
      .clk(clk),
      .rst(BTNL), //START button resets clk
      .en(timer_start), //FIXME: LED turns on, enables reaction counter
      .tic(tic)
    );
    
    //random counter
    counter #(.N(17)) rcnt1(
      .clk(clk),
      .rst(BTNU), //CLEAR button resets random counter
      .en(BTNL), //START button enables random counter
      .tic(rtic)
    );
    
    //random number generator
    prbslfsr #(.N(4)) p1(
      .clk(clk),
      .rst(BTNL), //START button generates random number
      .rnd(rnd)
    );
    
    //scanning display
    scanning_display scd1(
      .clk(clk),
      .rst(BTNU),
      .data(data),
      .AN(AN),
      .char(char)
    );
    
    //sseg display
    sseg_disp sd1(
      //.position(pos),
      .character(char),
      //.AN(AN),
      .CA(CA),
      .CB(CB),
      .CC(CC),
      .CD(CD),
      .CE(CE),
      .CF(CF),
      .CG(CG)
    );      
    
    //random count adder
    adder rca1(
      .en(BTNL), //random count starts on transition to BUFF state
      .rst(BTNU), //random count resets when system resets
      .tic(rtic),
      .out(rcnt)
    );
    
    //reaction time count adder
    adder rtca1(
      .en(timer_start), //FIXME: reaction time count starts on transition to TEST state
      .rst(BTNC), //reaction time count resets when system resets
      .tic(tic),
      .out(timer)
    );
    
    always_ff @(posedge(clk), posedge(BTNU))
      if(BTNU) begin
        state<=INIT;
        data<=CLR;
      end
      else
        state<=nstate;
        
//    always_ff @(posedge(tic), posedge(rtic))
//      if(tic)
//        timer=timer+1;
//      else
//        rcnt=rcnt+1;
    
    always_comb begin
      nstate=state;
      case(state)
      INIT: begin
        LED[0]=1'b0;
        //timer_start = 1'b0;
        data=HI;
        
        if(BTNL) begin
          nstate=BUFF;
          //rcnt=0;
          data=CLR;
        end
      end
      
      BUFF: begin          
        if(BTNC) begin
          data=ERR;
          nstate=DISP;
        end
        else if(rcnt >= rnd) begin
          nstate=TEST;
          timer_start = 1'b1;
        end
      end
        
      TEST: begin
        LED[0]=1'b1;
        if(BTNC | timer >= 1000)
          nstate=DISP;
          cnt=timer;
      end
       
      DISP: begin
        LED[0] = 1'b0;
        //pos=3;
        if(data==ERR)
          data=ERR;
        else
          data=cnt;
//        pos=2;
//        char=((cnt%1000)-(cnt%100)) / 100;
//        pos=1;
//        char=((cnt%100) - (cnt%10)) / 10;
//        pos=0;
//        char=cnt%10;
      end
      
      endcase
      
    end
    
    
endmodule
