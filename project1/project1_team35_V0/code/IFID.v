module IFID (
    clk_i,
    start_i,
    addr_i,
    inst_i,
    IFIDWrite_i,
    Flush_i,
    addr_o,
    inst_o
);

input clk_i, start_i;
input   IFIDWrite_i, Flush_i;
input [31:0] addr_i, inst_i;
output [31:0] addr_o, inst_o;
reg [31:0] addr_o, inst_o;

always @ ( posedge clk_i or negedge start_i) begin
  if (start_i == 0) begin
    addr_o <= 0;
    inst_o <= 0;
  end
  else if (Flush_i) begin
    addr_o <= 0;
    inst_o <= 0;
  end
  else begin
    if (IFIDWrite_i) begin //stall
        addr_o <= addr_o;
        inst_o <= inst_o;
    end
    else begin
        addr_o <= addr_i;
        inst_o <= inst_i;
    end
  end
end
endmodule
