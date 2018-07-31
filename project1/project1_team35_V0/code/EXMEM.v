module EXMEM
(
	clk_i,
	start_i,
	RegWrite_i,
	MemtoReg_i,
	MemRead_i,
	MemWrite_i,
	ALUzero_i,
	ALUdata_i,
    RegWaddr_i,
    MemWdata_i,
	RegWrite_o,
	MemtoReg_o,
	MemRead_o,
	MemWrite_o,
	ALUzero_o,
	ALUdata_o,
    RegWaddr_o,
    MemWdata_o
);

input clk_i, start_i;
input RegWrite_i, MemtoReg_i, MemRead_i, MemWrite_i, ALUzero_i;
input [31:0] ALUdata_i;
input [4:0] RegWaddr_i;
input [31:0] MemWdata_i;
output RegWrite_o, MemtoReg_o, MemRead_o, MemWrite_o, ALUzero_o;
output [31:0] ALUdata_o;
output [4:0] RegWaddr_o;
output [31:0] MemWdata_o;
reg RegWrite_o, MemtoReg_o, MemRead_o, MemWrite_o, ALUzero_o;
reg [31:0] ALUdata_o;
reg [4:0]  RegWaddr_o;
reg [31:0] MemWdata_o;
always @ ( posedge clk_i or negedge start_i) begin
  if (~start_i) begin 
	RegWrite_o <= 0;
	MemtoReg_o <= 0;
	MemRead_o <= 0;
	MemWrite_o <= 0;
	ALUzero_o <= 0;
	ALUdata_o <= 0;
	RegWaddr_o <= 0;
    MemWdata_o <= 0;
  end
  else begin    
	RegWrite_o <= RegWrite_i;
	MemtoReg_o <= MemtoReg_i;
	MemRead_o <= MemRead_i;
	MemWrite_o <= MemWrite_i;
	ALUzero_o <= ALUzero_i;
	ALUdata_o <= ALUdata_i;
	RegWaddr_o <= RegWaddr_i;
    MemWdata_o <= MemWdata_i;
  end
end
endmodule
