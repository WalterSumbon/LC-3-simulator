`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/12 01:40:22
// Design Name: 
// Module Name: clean_posedge
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


module	clean_posedge(
input	clk,
input	btn,
output	btn_clean);
reg	[15:0]	cnt;
reg	[1:0]	delay_sig;

always @(negedge clk)
begin
	if(btn == 1'b0)
		cnt <= 16'b0;
	else if(cnt < 16'h8000)
		cnt <= cnt +1'b1;
end
always @(negedge clk)
	delay_sig <= {delay_sig[0],cnt[15]};

assign	btn_clean = delay_sig[0] & (~delay_sig[1]);
endmodule
