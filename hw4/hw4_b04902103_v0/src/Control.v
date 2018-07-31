module Control(
    Op_i,
    RegDst_o,
    ALUOp_o,
    ALUSrc_o,
    RegWrite_o
);

    input [5:0] Op_i;
    output RegDst_o, ALUOp_o, ALUSrc_o, RegWrite_o;

    assign RegDst_o = (Op_i == 6'b000000)? 1'b1: 1'b0;
    assign ALUOp_o = (Op_i == 6'b000000)? 1'b1: 1'b0;
    assign ALUSrc_o = (Op_i == 6'b000000)? 1'b0: 1'b1;
    assign RegWrite_o = 1'b1;
endmodule
