module Forwarding_Unit (
    EXMEMRegWrite_i,
    MEMWBRegWrite_i,
    IDEXRs_i,
    IDEXRt_i,
    EXMEMRd_i,
    MEMWBRd_i,
    ForwardA_o,
    ForwardB_o
);

input EXMEMRegWrite_i, MEMWBRegWrite_i;
input [4:0] IDEXRs_i, IDEXRt_i;
input [4:0] EXMEMRd_i, MEMWBRd_i;
output [1:0] ForwardA_o, ForwardB_o; //ALU Operand first and second

reg [1:0] ForwardA_o, ForwardB_o; //ALU Operand first and second
always @(*) begin
    if (EXMEMRegWrite_i && EXMEMRd_i != 0 && EXMEMRd_i == IDEXRs_i)
        ForwardA_o <= 2'b10;
    else if (MEMWBRegWrite_i && MEMWBRd_i != 0 && MEMWBRd_i == IDEXRs_i)
        ForwardA_o <= 2'b01;
    else
        ForwardA_o <= 2'b0;

    if (EXMEMRegWrite_i && EXMEMRd_i != 0 && EXMEMRd_i == IDEXRt_i)
        ForwardB_o <= 2'b10;
    else if (MEMWBRegWrite_i && MEMWBRd_i != 0 && MEMWBRd_i == IDEXRt_i)
        ForwardB_o <= 2'b01;
    else
        ForwardB_o <= 2'b0;
end

endmodule
