module clk_gen(
    clk, 
    reset, 
    clk_1K
);

input           clk;
input           reset;
output          clk_1K;

reg             clk_1K;

parameter   CNT = 16'd500;

reg     [15:0]  count;

always @(posedge clk or posedge reset) //时钟信号要来自管脚信号，不过防抖就会被认成不来自时钟管脚，就会报错
begin
    if(reset) begin
        clk_1K <= 1'b1;
        count <= 16'd0;
    end
    else begin
        count <= (count==CNT-16'd1) ? 16'd0 : count + 16'd1;
        clk_1K <= (count==16'd0) ? ~clk_1K : clk_1K;
    end
end

endmodule
