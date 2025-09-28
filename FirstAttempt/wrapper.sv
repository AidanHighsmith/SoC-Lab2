`timescale 1ns / 1ps

module wrapper(
    input clk,
    input BTNC,
    input BTNU,
    input BTNL,
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
    
    driver D1 (
        .clk(clk),
        .BTNC(BTNC),
        .BTNU(BTNU),
        .BTNL(BTNL),
        .LED(LED),
        .AN(AN),
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG)
    );
    
    
endmodule
