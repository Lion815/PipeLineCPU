module InstructionMemory(
	input      [32 -1:0] Address, 
	output reg [32 -1:0] Instruction
);
	
	always @(*)
		case (Address[9:2])			// 只看指令地址的后8个bit（不包含Byte需要*4产生的00位）
				//		addi $a0 $zero 5	# x = 5
//		lui $t0 0x4000
//		addi $t0 $t0 0		# $t0 = address of reg_op
//		sw $a0 0($t0)		# set reg_op = 5
//		lui $t1 0x4000
//		addi $t1 $t0 8		# $t1 = address of reg_start
//		addi $a1 $zero 1	# $a1 = 1
//		sw $a1 0($t1)		# set reg_start = 1
//		addi $a0 $zero 7	# y = 7
//		jal h_y				# calc y^2 + y
//		addi $s1 $v0 0		# $s1 = h(y)
//		lui $t2 0x4000
//		addi $t2 $t2 4		# $t2 = address of reg_ans
//		lw $s0 0($t2)		# $s0 = g(x)
//		sub $s2 $s0 $s1		# $s2 = f(x, y)
//	loop:
//		j loop
//	h_y:
//		add $t0 $zero $a0	# partial sum $t0 = y
//		mul $t1 $a0 $a0		# $t1 = y^2
//		add $t0 $t0 $t1		# $t0 = y + y^2
//		addi $v0 $t0 0		# $v0 = $t0
//		jr $ra				# return h(y)

// 8'd0:	Instruction <= 32'h20040005;
// 8'd1:	Instruction <= 32'h3c084000;
// 8'd2:	Instruction <= 32'h21080000;
// 8'd3:	Instruction <= 32'had040000;
// 8'd4:	Instruction <= 32'h3c094000;
// 8'd5:	Instruction <= 32'h21090008;
// 8'd6:	Instruction <= 32'h20050001;
// 8'd7:	Instruction <= 32'had250000;
// 8'd8:	Instruction <= 32'h20040007;
// 8'd9:	Instruction <= 32'h0c100010;  //jal h_y
// 8'd10:	Instruction <= 32'h20510000;
// 8'd11:	Instruction <= 32'h3c0a4000;
// 8'd12:	Instruction <= 32'h214a0004;
// 8'd13:	Instruction <= 32'h8d500000;
// 8'd14:	Instruction <= 32'h02119022;
// 8'd15:	Instruction <= 32'h0810000f; // j 0x04
// 8'd16:	Instruction <= 32'h00044020; // h_y : add
// 8'd17:	Instruction <= 32'h70844802;
// 8'd18:	Instruction <= 32'h01094020;
// 8'd19:	Instruction <= 32'h21020000;
// 8'd20:	Instruction <= 32'h03e00008;

8'd0:   Instruction <= 32'h8c100000;
8'd1:   Instruction <= 32'h00102021;
8'd2:   Instruction <= 32'h21050004;
8'd3:   Instruction <= 32'h20060320;
8'd4:   Instruction <= 32'hacc00000;
8'd5:   Instruction <= 32'h2409ffff;
8'd6:   Instruction <= 32'h20100001;
8'd7:   Instruction <= 32'h0204082a;
8'd8:   Instruction <= 32'h10200005;
8'd9:   Instruction <= 32'h00105880;
8'd10:   Instruction <= 32'h00cb5020;
8'd11:   Instruction <= 32'had490000;
8'd12:   Instruction <= 32'h22100001;
8'd13:   Instruction <= 32'h08100007;
8'd14:   Instruction <= 32'h20100001;
8'd15:   Instruction <= 32'h0204082a;
8'd16:   Instruction <= 32'h10200024;
8'd17:   Instruction <= 32'h20110000;
8'd18:   Instruction <= 32'h0224082a;
8'd19:   Instruction <= 32'h1020001f;
8'd20:   Instruction <= 32'h00114940;
8'd21:   Instruction <= 32'h20120000;
8'd22:   Instruction <= 32'h0244082a;
8'd23:   Instruction <= 32'h10200019;
8'd24:   Instruction <= 32'h01324020;
8'd25:   Instruction <= 32'h00084080;
8'd26:   Instruction <= 32'h01054020;
8'd27:   Instruction <= 32'h8d0a0000;
8'd28:   Instruction <= 32'h2001ffff;
8'd29:   Instruction <= 32'h102a0011;
8'd30:   Instruction <= 32'h12320010;
8'd31:   Instruction <= 32'h00114080;
8'd32:   Instruction <= 32'h01064020;
8'd33:   Instruction <= 32'h8d0b0000;
8'd34:   Instruction <= 32'h2001ffff;
8'd35:   Instruction <= 32'h102b000b;
8'd36:   Instruction <= 32'h00124080;
8'd37:   Instruction <= 32'h01064020;
8'd38:   Instruction <= 32'h8d0c0000;
8'd39:   Instruction <= 32'h016a6820;
8'd40:   Instruction <= 32'h2001ffff;
8'd41:   Instruction <= 32'h102c0003;
8'd42:   Instruction <= 32'h01ac082a;
8'd43:   Instruction <= 32'h14200001;
8'd44:   Instruction <= 32'h0810002f;
8'd45:   Instruction <= 32'had0d0000;
8'd46:   Instruction <= 32'h0810002f;
8'd47:   Instruction <= 32'h22520001;
8'd48:   Instruction <= 32'h08100016;
8'd49:   Instruction <= 32'h22310001;
8'd50:   Instruction <= 32'h08100012;
8'd51:   Instruction <= 32'h22100001;
8'd52:   Instruction <= 32'h0810000f;
8'd53:   Instruction <= 32'h20080000;
8'd54:   Instruction <= 32'h8cc90000;
8'd55:   Instruction <= 32'h01094020;
8'd56:   Instruction <= 32'h8cc90004;
8'd57:   Instruction <= 32'h01094020;
8'd58:   Instruction <= 32'h8cc90008;
8'd59:   Instruction <= 32'h01094020;
8'd60:   Instruction <= 32'h8cc9000c;
8'd61:   Instruction <= 32'h01094020;
8'd62:   Instruction <= 32'h8cc90010;
8'd63:   Instruction <= 32'h01094020;
8'd64:   Instruction <= 32'h8cc90014;
8'd65:   Instruction <= 32'h01094020;
8'd66:   Instruction <= 32'h210a0000;
8'd67:   Instruction <= 32'h200c0000;
8'd68:   Instruction <= 32'h200b000a;
8'd69:   Instruction <= 32'h014b5022;
8'd70:   Instruction <= 32'h218c0001;
8'd71:   Instruction <= 32'h1d40fffd;
8'd72:   Instruction <= 32'h1140fffc;
8'd73:   Instruction <= 32'h014b8020;
8'd74:   Instruction <= 32'h218cffff;
8'd75:   Instruction <= 32'h218a0000;
8'd76:   Instruction <= 32'h200c0000;
8'd77:   Instruction <= 32'h200b0064;
8'd78:   Instruction <= 32'h014b5022;
8'd79:   Instruction <= 32'h218c0001;
8'd80:   Instruction <= 32'h1d40fffd;
8'd81:   Instruction <= 32'h1140fffc;
8'd82:   Instruction <= 32'h014b8820;
8'd83:   Instruction <= 32'h218cffff;
8'd84:   Instruction <= 32'h218a0000;
8'd85:   Instruction <= 32'h200c0000;
8'd86:   Instruction <= 32'h200b03e8;
8'd87:   Instruction <= 32'h014b5022;
8'd88:   Instruction <= 32'h218c0001;
8'd89:   Instruction <= 32'h1d40fffd;
8'd90:   Instruction <= 32'h1140fffc;
8'd91:   Instruction <= 32'h014b9020;
8'd92:   Instruction <= 32'h218cffff;
8'd93:   Instruction <= 32'h218a0000;
8'd94:   Instruction <= 32'h200c0000;
8'd95:   Instruction <= 32'h200b2710;
8'd96:   Instruction <= 32'h014b5022;
8'd97:   Instruction <= 32'h218c0001;
8'd98:   Instruction <= 32'h1d40fffd;
8'd99:   Instruction <= 32'h1140fffc;
8'd100:   Instruction <= 32'h014b9820;
8'd101:   Instruction <= 32'h218cffff;
8'd102:   Instruction <= 32'h02002020;
8'd103:   Instruction <= 32'h0c100073;
8'd104:   Instruction <= 32'h20540800;
8'd105:   Instruction <= 32'h02202020;
8'd106:   Instruction <= 32'h0c100073;
8'd107:   Instruction <= 32'h20550400;
8'd108:   Instruction <= 32'h02402020;
8'd109:   Instruction <= 32'h0c100073;
8'd110:   Instruction <= 32'h20560200;
8'd111:   Instruction <= 32'h02602020;
8'd112:   Instruction <= 32'h0c100073;
8'd113:   Instruction <= 32'h20570100;
8'd114:   Instruction <= 32'h0810009c;
8'd115:   Instruction <= 32'h20080000;
8'd116:   Instruction <= 32'h10880012;
8'd117:   Instruction <= 32'h20080001;
8'd118:   Instruction <= 32'h10880012;
8'd119:   Instruction <= 32'h20080002;
8'd120:   Instruction <= 32'h10880012;
8'd121:   Instruction <= 32'h20080003;
8'd122:   Instruction <= 32'h10880012;
8'd123:   Instruction <= 32'h20080004;
8'd124:   Instruction <= 32'h10880012;
8'd125:   Instruction <= 32'h20080005;
8'd126:   Instruction <= 32'h10880012;
8'd127:   Instruction <= 32'h20080006;
8'd128:   Instruction <= 32'h10880012;
8'd129:   Instruction <= 32'h20080007;
8'd130:   Instruction <= 32'h10880012;
8'd131:   Instruction <= 32'h20080008;
8'd132:   Instruction <= 32'h10880012;
8'd133:   Instruction <= 32'h20080009;
8'd134:   Instruction <= 32'h10880012;
8'd135:   Instruction <= 32'h2002003f;
8'd136:   Instruction <= 32'h0810009b;
8'd137:   Instruction <= 32'h20020006;
8'd138:   Instruction <= 32'h0810009b;
8'd139:   Instruction <= 32'h2002005b;
8'd140:   Instruction <= 32'h0810009b;
8'd141:   Instruction <= 32'h2002004f;
8'd142:   Instruction <= 32'h0810009b;
8'd143:   Instruction <= 32'h20020066;
8'd144:   Instruction <= 32'h0810009b;
8'd145:   Instruction <= 32'h2002006d;
8'd146:   Instruction <= 32'h0810009b;
8'd147:   Instruction <= 32'h2002007d;
8'd148:   Instruction <= 32'h0810009b;
8'd149:   Instruction <= 32'h20020007;
8'd150:   Instruction <= 32'h0810009b;
8'd151:   Instruction <= 32'h2002007f;
8'd152:   Instruction <= 32'h0810009b;
8'd153:   Instruction <= 32'h2002006f;
8'd154:   Instruction <= 32'h0810009b;
8'd155:   Instruction <= 32'h03e00008;
8'd156:   Instruction <= 32'h20080001;
8'd157:   Instruction <= 32'h20187530;
8'd158:   Instruction <= 32'h11180012;
8'd159:   Instruction <= 32'h3c194000;
8'd160:   Instruction <= 32'h23390010;
8'd161:   Instruction <= 32'haf340000;
8'd162:   Instruction <= 32'h0c1000aa;
8'd163:   Instruction <= 32'haf350000;
8'd164:   Instruction <= 32'h0c1000aa;
8'd165:   Instruction <= 32'haf360000;
8'd166:   Instruction <= 32'h0c1000aa;
8'd167:   Instruction <= 32'haf370000;
8'd168:   Instruction <= 32'h0c1000aa;
8'd169:   Instruction <= 32'h0810009e;
8'd170:   Instruction <= 32'h20090001;
8'd171:   Instruction <= 32'h200a0064;
8'd172:   Instruction <= 32'h112a0003;
8'd173:   Instruction <= 32'h21290001;
8'd174:   Instruction <= 32'h00000000;
8'd175:   Instruction <= 32'h081000ac;
8'd176:   Instruction <= 32'h03e00008;
8'd177:   Instruction <= 32'h00000000;






endcase
		
endmodule
