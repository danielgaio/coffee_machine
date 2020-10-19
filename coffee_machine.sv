// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// Generated by Quartus Prime Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition
// Created on Mon Oct 19 09:57:04 2020

// synthesis message_off 10175

`timescale 1ns/1ns

module coffee_machine (
    input reset, input clock, input money_in025, input money_in05, input money_in1,
    output reg sai_cafe);

    //reg reg_sai_cafe;
	 //reg reg_coffee_counter, reg_coffee_counter_temp;
    enum int unsigned { waiting=0, s025=1, s05=2, s075=3, coffee_out=4 } fstate, reg_fstate;

    always_ff @(posedge clock)
    begin
        if (clock) begin
            fstate <= reg_fstate;
        end
    end

    always_comb begin
        if (reset) begin
            reg_fstate <= waiting;
            //reg_sai_cafe <= 1'b0;
            sai_cafe <= 1'b0;
				//coffee_counter <= 0;
        end
        else begin
            //reg_sai_cafe <= 1'b0;
            
            sai_cafe <= 1'b0; // esse �e original, nao tirar
				//coffee_counter <= 0;
            case (fstate)
                s025: begin
                    if (((money_in05 & ~(money_in025)) & ~(money_in1)))
                        reg_fstate <= s075;
                    else if (((money_in1 & ~(money_in025)) & ~(money_in05)))
                        reg_fstate <= coffee_out;
                    else if (((money_in025 & ~(money_in05)) & ~(money_in1)))
                        reg_fstate <= s05;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s025;

                    //reg_sai_cafe <= 1'b0;
                    sai_cafe <= 1'b0;
						  //reg_coffee_counter <= 0;
                end
                s075: begin
                    if (((money_in025 | money_in05) | money_in1))
                        reg_fstate <= coffee_out;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s075;

                    //reg_sai_cafe <= 1'b0;
                    sai_cafe <= 1'b0;
						  //reg_coffee_counter <= 0;
                end
                coffee_out: begin
                    reg_fstate <= waiting;

                    //reg_sai_cafe <= 1'b1;
                    sai_cafe <= 1'b1;
						  //reg_coffee_counter <= reg_coffee_counter_temp + 1;
                end
                s05: begin
                    if (((money_in025 & ~(money_in05)) & ~(money_in1)))
                        reg_fstate <= s075;
                    else if ((money_in05 | (money_in1 & ~(money_in025))))
                        reg_fstate <= coffee_out;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= s05;

                    //reg_sai_cafe <= 1'b0;
                    sai_cafe <= 1'b0;
						  //reg_coffee_counter <= 0;
                end
                waiting: begin
                    if (((money_in025 & ~(money_in05)) & ~(money_in1)))
                        reg_fstate <= s025;
                    else if (((money_in1 & ~(money_in025)) & ~(money_in05)))
                        reg_fstate <= coffee_out;
                    else if (((money_in05 & ~(money_in025)) & ~(money_in1)))
                        reg_fstate <= s05;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= waiting;

                    //reg_sai_cafe <= 1'b0;
                    sai_cafe <= 1'b0;
						  //reg_coffee_counter <= 0;
                end
                default: begin
                    //reg_sai_cafe <= 1'bx;
                    sai_cafe <= 1'bx;
						  //reg_coffee_counter <= 0;
                    $display ("Reach undefined state");
                end
            endcase
            //sai_cafe <= reg_sai_cafe;
				//coffee_counter <= reg_coffee_counter;
        end
    end
endmodule // coffee_machine
