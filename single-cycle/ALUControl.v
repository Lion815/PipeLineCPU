
module ALUControl(
	input  [4 -1:0] ALUOp      ,		//ALUOp哪来的
	input  [6 -1:0] Funct      ,
	output reg [5 -1:0] ALUCtl ,
	output Sign
);
	
	// Add your code below (for question 2)
	// funct number for different operation
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
	parameter aluGtz = 5'b00011;					// 和零比大小，小于零ALU输出0->zero信号为1
	parameter aluBne = 5'b00100;					// 相减为0输出1，否则输出0
	
	// Sign means whether the ALU treats the input as a signed number or an unsigned number
	// beq是无符号, 但是bgtz要是有符号
	assign Sign = (ALUOp[2:0] == 3'b010)? ~Funct[0]: ~ALUOp[3];
	
	// set aluFunct
	reg [4:0] aluFunct;
	always @(*)
		case (Funct)
			6'b00_0000: aluFunct <= aluSLL;
			6'b00_0010: aluFunct <= aluSRL;
			6'b00_0011: aluFunct <= aluSRA;
			6'b10_0000: aluFunct <= aluADD;
			6'b10_0001: aluFunct <= aluADD;
			6'b10_0010: aluFunct <= aluSUB;
			6'b10_0011: aluFunct <= aluSUB;
			6'b10_0100: aluFunct <= aluAND;
			6'b10_0101: aluFunct <= aluOR;
			6'b10_0110: aluFunct <= aluXOR;
			6'b10_0111: aluFunct <= aluNOR;
			6'b10_1010: aluFunct <= aluSLT;
			6'b10_1011: aluFunct <= aluSLT;
			default: aluFunct <= aluADD;
		endcase
	
	// set ALUCtrl
	always @(*)
		case (ALUOp[2:0])
			3'b000: ALUCtl <= aluADD;
			3'b001: ALUCtl <= aluSUB;
			3'b100: ALUCtl <= aluAND;
			3'b101: ALUCtl <= aluSLT;
			3'b010: ALUCtl <= aluFunct;
			3'b011: ALUCtl <= aluMul;		//新增
			3'b110:	ALUCtl <= aluBne;				//bne
			3'b111: ALUCtl <= aluGtz;
			default: ALUCtl <= aluADD;
		endcase
	// Add your code above (for question 2)

endmodule
