module ALU(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o,
    Zero_o
);

input [31:0] data1_i, data2_i;
input [2:0] ALUCtrl_i;
output [31:0] data_o;
output Zero_o;

assign data_o = (ALUCtrl_i == 3'b000)? (data1_i & data2_i):
(ALUCtrl_i == 3'b001)? (data1_i | data2_i):
(ALUCtrl_i == 3'b010)? (data1_i + data2_i):
(ALUCtrl_i == 3'b011)? (data1_i - data2_i):
(ALUCtrl_i == 3'b100)? (data1_i * data2_i):
(data1_i + data2_i);

endmodule
