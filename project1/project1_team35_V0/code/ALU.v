module ALU (data1_i, data2_i, ALUCtrl_i, data_o, Zero_o);

input [31:0] data1_i,data2_i;
input [2:0] ALUCtrl_i;

output [31:0] data_o;
output Zero_o;

reg [31:0] data_o;
reg Zero_o;
always @(*) begin
  case (ALUCtrl_i)
    3'b000: data_o = data1_i + data2_i;
    3'b001: data_o = data1_i - data2_i;
    3'b010: data_o = data1_i * data2_i;
    3'b011: data_o = data1_i & data2_i;
    3'b100: data_o = data1_i | data2_i;
    default: data_o = data1_i + data2_i; //don't care
  endcase

  if (data_o == 0) Zero_o = 1'b1;
  else Zero_o = 1'b0;
end


endmodule
