module PC
(
    clk_i,
    start_i,
    pc_i,
    PCWrite_i,
    pc_o
);

// Ports
input               clk_i;
input               start_i;
input   PCWrite_i;
input   [31:0]      pc_i;
output  [31:0]      pc_o;

// Wires & Registers
reg     [31:0]      pc_o;


initial
 begin
    pc_o=0;
  end
always@(posedge clk_i) begin
    if (PCWrite_i)
        pc_o <= pc_o;
    else if (start_i == 1)
        pc_o <= pc_i;
end

endmodule
