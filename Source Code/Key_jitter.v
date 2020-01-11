module key_jitter(
     input clkin,     
     input key_in,//输入
	  output key_posedge,//消抖后按键上升沿
	  output key_negedge,//消抖后按键下降沿
     output key_value//消抖后按键
);

// inner signal
reg [1:0] key_in_r;
wire pp;
reg [19:0] cnt_base;
reg key_value_r=0;
reg key_value_rd=0;

//内部信号
always@(posedge clkin)
    key_in_r<= {key_in_r[0],key_in};

// 检测有输入有没有变化
assign pp = key_in_r[0]^key_in_r[1]; 

//延迟计数器
always@(posedge clkin)
    if(pp==1'b1)
       cnt_base <= 20'd0;
    else
       cnt_base <=  cnt_base + 1;

//输出
always@(posedge clkin)
   if(cnt_base==20'hf_ffff)
        key_value_r <=  key_in_r[0];

always@(posedge clkin)
   key_value_rd <=  key_value_r;

assign key_value = key_value_r;

assign key_posedge=key_value_r & ~key_value_rd;
assign key_negedge=~key_value_r & key_value_rd;

endmodule