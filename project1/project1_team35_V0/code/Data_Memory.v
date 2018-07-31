module Data_Memory
(
    addr_i,
    data_i,
    MemWrite_i,
    MemRead_i,
    data_o
);
// input [4:0] addr;
input [31:0] addr_i;
input [31:0] data_i;
input MemWrite_i, MemRead_i;
output [31:0] data_o;

reg [7:0] memory [0:31];

wire [31:0] con;
assign con = { memory[addr_i + 3],
    memory[addr_i + 2],
    memory[addr_i + 1],
    memory[addr_i]
};
assign data_o = (MemRead_i) ? con : 32'b0;

always @(*) begin
    if(MemWrite_i) begin
        memory[addr_i + 3] <= data_i[31:24];
        memory[addr_i + 2] <= data_i[23:16];
        memory[addr_i + 1] <= data_i[15:8];
        memory[addr_i] <= data_i[7:0];
    end
end

endmodule
