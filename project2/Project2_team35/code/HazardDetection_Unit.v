module HazardDetection_Unit(
    IDEXMemRead_i,
    IDEXRt_i,
    IFIDRs_i,
    IFIDRt_i,
    PCWrite_o,
    IFIDWrite_o,
    ControlSrc_o
);

input IDEXMemRead_i;
input [4:0] IDEXRt_i, IFIDRs_i, IFIDRt_i;
output PCWrite_o, IFIDWrite_o, ControlSrc_o;
reg PCWrite_o, IFIDWrite_o, ControlSrc_o;

always @(*) begin
    if (IDEXMemRead_i && IDEXRt_i == IFIDRs_i) begin
        PCWrite_o <= 1'b1;
        IFIDWrite_o <= 1'b1;
        ControlSrc_o <= 1'b1;
    end
    else if (IDEXMemRead_i && IDEXRt_i == IFIDRt_i) begin
        PCWrite_o <= 1'b1;
        IFIDWrite_o <= 1'b1;
        ControlSrc_o <= 1'b1;
    end
    else begin
        PCWrite_o <= 1'b0;
        IFIDWrite_o <= 1'b0;
        ControlSrc_o <= 1'b0;
    end
end

endmodule
