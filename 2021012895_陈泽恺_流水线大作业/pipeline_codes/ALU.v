module ALU(
	input [32 -1:0] in1      , 
	input [32 -1:0] in2      ,
	input [5 -1:0] ALUCtl    ,
	input Sign               ,				// 标示是否是unsigned运算， 在ALUControl中产生， 1表示有符号， 0为无符号
	output reg [32 -1:0] out ,
	output zero
);
	// zero means whether the output is zero or not
	assign zero = (out == 0);
	
	wire ss;
	assign ss = {in1[31], in2[31]};
	
	wire lt_31;
	assign lt_31 = (in1[30:0] < in2[30:0]);
	
	// lt_signed means whether (in1 < in2)
	wire lt_signed;
	assign lt_signed = (in1[31] ^ in2[31])? 
		((ss == 2'b01)? 0: 1): lt_31;				// 有符号比较
	
	// Add your code below (for question 2)
	
	// different ALU operations
	always @(*)
		case (ALUCtl)
			5'b00000: out <= in1 & in2;
			5'b00001: out <= in1 | in2;
			5'b00010: out <= in1 + in2;
			5'b00110: out <= in1 - in2;
			5'b00111: out <= {31'h00000000, Sign? lt_signed: (in1 < in2)};
			5'b01100: out <= ~(in1 | in2);
			5'b01101: out <= in1 ^ in2;
			5'b10000: out <= (in2 << in1[4:0]);
			5'b11000: out <= (in2 >> in1[4:0]);
			5'b11001: out <= ({{32{in2[31]}}, in2} >> in1[4:0]);
//			5'b11010: out <= in1 * in2;					//乘法
//			5'b00011: out <= {31'h00000000, ((in1[31] == 1)|(in1 == 0))};
			// 和零比大小，如果符号位是1或者全0就是负数，就输出1，zero输出0，否则就是大于0，ALU输出0->zero信号为1
//			5'b00100: out <= {31'h00000000, (in1 == in2)};		// 相减为0输出1，否则输出0
			default: out <= 32'h00000000;
		endcase
	// Add your code above (for question 2)
	
endmodule

/* 
	parameter aluAND = 5'b00000;
	parameter aluOR  = 5'b00001;
	parameter aluADD = 5'b00010;
	parameter aluSUB = 5'b00110;
	parameter aluSLT = 5'b00111;
	parameter aluNOR = 5'b01100;
	parameter aluXOR = 5'b01101;
	parameter aluSLL = 5'b10000;
	parameter aluSRL = 5'b11000;
	parameter aluSRA = 5'b11001; 
	parameter aluMul = 5'b11010;					//乘法
	parameter aluGtz = 5'b00011;					// 和零比大小，如果大于0就输出0，zero输出1，小于零ALU输出0->zero信号为1
	parameter aluBne = 5'b00100;					// 相减为0输出1，否则输出0
*/