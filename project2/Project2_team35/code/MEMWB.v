module MEMWB
(
	clk_i,
	start_i,
	RegWrite_i,
	MemtoReg_i,
	ReadData_i,
	ALUdata_i,
  RegWaddr_i,
  MEMWBEnable_i,
	RegWrite_o,
	MemtoReg_o,
	ReadData_o,
	ALUdata_o,
	RegWaddr_o
);

input clk_i, start_i;
input MEMWBEnable_i;
input  RegWrite_i, MemtoReg_i;
input [31:0] ReadData_i, ALUdata_i;
input [4:0]  RegWaddr_i;
output  RegWrite_o, MemtoReg_o;
output [31:0] ReadData_o, ALUdata_o;
output [4:0] RegWaddr_o;
reg  RegWrite_o, MemtoReg_o;
reg [31:0] ReadData_o, ALUdata_o;
reg [4:0] RegWaddr_o;

always @ ( posedge clk_i or negedge start_i) begin
  if (~start_i || MEMWBEnable_i) begin
    RegWrite_o <= 0;
    MemtoReg_o <= 0;
    ReadData_o <= 0;
    ALUdata_o <= 0;
    RegWaddr_o <= 0;
  end
  else begin
    RegWrite_o <= RegWrite_i;
    MemtoReg_o <= MemtoReg_i;
    ReadData_o <= ReadData_i;
    ALUdata_o <= ALUdata_i;
    RegWaddr_o <= RegWaddr_i;
  end
end
endmodule
