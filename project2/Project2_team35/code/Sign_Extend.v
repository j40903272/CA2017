module Sign_Extend (data_i, data_o);

input [15:0] data_i;
output [31:0] data_o;

assign data_o = { 16'b0, data_i };

endmodule
