module MUX8 (data1_i, data2_i, select_i, data_o);

input [7:0] data1_i;
input [7:0] data2_i;
input select_i;
output [7:0] data_o;

assign data_o = (!select_i) ? data1_i : data2_i;

endmodule
