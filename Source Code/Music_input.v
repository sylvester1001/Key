module mima_input(
input clk,

input key_0,
input key_1,
input key_2,
input key_3,
input key_4,
input key_5,
input key_6,
input key_7,
input key_8,
input key_9,

input [2:0] current_state,

output [23:0] password
);

reg key_0_buf1=0;
reg key_1_buf1=0;
reg key_2_buf1=0;
reg key_3_buf1=0;
reg key_4_buf1=0;
reg key_5_buf1=0;
reg key_6_buf1=0;
reg key_7_buf1=0;
reg key_8_buf1=0;
reg key_9_buf1=0;

reg key_0_buf2=0;
reg key_1_buf2=0;
reg key_2_buf2=0;
reg key_3_buf2=0;
reg key_4_buf2=0;
reg key_5_buf2=0;
reg key_6_buf2=0;
reg key_7_buf2=0;
reg key_8_buf2=0;
reg key_9_buf2=0;

wire key_0_rise;
wire key_1_rise;
wire key_2_rise;
wire key_3_rise;
wire key_4_rise;
wire key_5_rise;
wire key_6_rise;
wire key_7_rise;
wire key_8_rise;
wire key_9_rise;

always@(posedge clk)
begin
key_0_buf1<=key_0;
key_1_buf1<=key_1;
key_2_buf1<=key_2;
key_3_buf1<=key_3;
key_4_buf1<=key_4;
key_5_buf1<=key_5;
key_6_buf1<=key_6;
key_7_buf1<=key_7;
key_8_buf1<=key_8;
key_9_buf1<=key_9;

key_0_buf2<=key_0_buf1;
key_1_buf2<=key_1_buf1;
key_2_buf2<=key_2_buf1;
key_3_buf2<=key_3_buf1;
key_4_buf2<=key_4_buf1;
key_5_buf2<=key_5_buf1;
key_6_buf2<=key_6_buf1;
key_7_buf2<=key_7_buf1;
key_8_buf2<=key_8_buf1;
key_9_buf2<=key_9_buf1;

end

assign key_0_rise=key_0_buf1 & ~key_0_buf2;
assign key_1_rise=key_1_buf1 & ~key_1_buf2;
assign key_2_rise=key_2_buf1 & ~key_2_buf2;
assign key_3_rise=key_3_buf1 & ~key_3_buf2;
assign key_4_rise=key_4_buf1 & ~key_4_buf2;
assign key_5_rise=key_5_buf1 & ~key_5_buf2;
assign key_6_rise=key_6_buf1 & ~key_6_buf2;
assign key_7_rise=key_7_buf1 & ~key_7_buf2;
assign key_8_rise=key_8_buf1 & ~key_8_buf2;
assign key_9_rise=key_9_buf1 & ~key_9_buf2;

reg [23:0] password_buf=24'd0;//pass,alarm--clear
always@(posedge clk)
if(current_state==3'd2 || current_state==3'd5)
	password_buf<=24'h0;	
else
	if(key_0_rise==1)
		password_buf<={password_buf[19:0],4'd0};
	else if(key_1_rise==1)
		password_buf<={password_buf[19:0],4'd1};
	else if(key_2_rise==1)
		password_buf<={password_buf[19:0],4'd2};
	else if(key_3_rise==1)
		password_buf<={password_buf[19:0],4'd3};
	else if(key_4_rise==1)
		password_buf<={password_buf[19:0],4'd4};	
	else if(key_5_rise==1)
		password_buf<={password_buf[19:0],4'd5};	
	else if(key_6_rise==1)
		password_buf<={password_buf[19:0],4'd6};	
	else if(key_7_rise==1)
		password_buf<={password_buf[19:0],4'd7};	
	else if(key_8_rise==1)
		password_buf<={password_buf[19:0],4'd8};	
	else if(key_9_rise==1)
		password_buf<={password_buf[19:0],4'd9};	
	else
		password_buf<=password_buf;	
	
	
assign password=password_buf;
	
endmodule