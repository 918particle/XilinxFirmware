`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:44:46 06/08/2018 
// Design Name: 
// Module Name:    counter_program 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//16'b0000000000000000
//16'b1111111111111111
module counter_program(
	input clk,
	input sig,
	output rfd,
	output [15:0] quotient,
	output [15:0] fractional,
	output lower_clk
	);

reg [15:0] count = 16'b000000000000000;
reg [15:0] tempc = 16'b000000000000000;
reg [15:0] count2 = 16'b000000000000000;
reg [15:0] tempc2 = 16'b000000000000000;
reg [15:0] sample =16'b000000000000000;
reg [15:0] temple = 16'b000000000000000;
reg lower_clk = 1'b0;

div divider (
	.clk(clk), // input clk
	.rfd(rfd), // output rfd
	.dividend(sample), // input [15 : 0] dividend
	.divisor(count), // input [15 : 0] divisor
	.quotient(quotient), // output [15 : 0] quotient
	.fractional(fractional)); // output [15 : 0] fractional



always @ (posedge sig)
begin
	if (count != 16'b1111111111111111)
	begin
		temple = sample + 1;
		sample = temple;
	end
	else
	begin
		temple = temple;
		sample = sample;
	end
	if (sample <= 16'b000000000000001 && count == 16'b1111111111111111 && lower_clk != 1)
	begin
	sample = 16'b000000000000000;
	end
	/*if (sample > 16'b1111111111111111)
	begin
	sample = 16'b000000000000000;
	temple = 16'b000000000000000;
	end
	else
	begin
	sample = sample;
	temple = temple;
	end
	sig_bit = sample[15:12];*/
end

always @ (posedge clk)
begin
	if (count !=  16'b1111111111111111 && sample != 16'b1111111111111111 && lower_clk != 1'b1)
	begin
		tempc = count + 1;
		count = tempc;
	end
	else
	begin
		if (sample <= 16'b000000000000001 && count == 16'b1111111111111111 && lower_clk != 1)
		begin
			tempc = 16'b000000000000000;
			count = 16'b000000000000000;
			lower_clk = 1'b1;
		end
		else
		begin
			tempc = tempc;
			count = count;
		end
	end
	
	if (lower_clk == 1'b1)
		begin
			tempc2 = count2 + 1;
			count2 = tempc2;
			if (count2 == 16'b0000001111101000 && count != 16'b1111111111111111)
			begin
				tempc2 = 16'b000000000000000;
				count2 = 16'b000000000000000;
				tempc = count + 1;
				count = tempc;
			end
			else
			begin
				tempc2 = tempc2;
				count2 = count2;
				tempc = tempc;
				count = count;
			end
		end
	else
		begin
			tempc = tempc;
			count = count;
		end
	
//0000 0011 1110 1000
//	if(switch1==1)
//	begin
//		tempc = tempc;
//		count = count;
//	end
	
	/*if (count == 16'b1111111111111111)
	begin
		count = 16'b000000000000000;
		tempc = 16'b000000000000000;
	end
	else
	begin
			tempc = count + 1;
			count = tempc;
	end*/
//	else begin
//		tempc = tempc;
//		count = count;
//	end
//	if(switch2==1)
//	begin
//		led = 4'b0000;
//		templ = 4'b0000;
//	end
end


endmodule




//		if (count == 32'b00000000000000000000000000000001)
//		begin
//			tempc = 32'b00000000000000000000000000000000;
//			count = 32'b00000000000000000000000000000000;

