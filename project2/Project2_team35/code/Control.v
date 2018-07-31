module Control
(
	Op_i,
	RegWrite_o,
	MemtoReg_o,
	Branch_o,
	MemRead_o,
	MemWrite_o,
	RegDst_o,
	ALUOp_o,
	ALUSrc_o,
	Jump_o
);

input [5:0] Op_i;
output RegWrite_o, MemtoReg_o, Branch_o, MemRead_o, MemWrite_o, RegDst_o, ALUSrc_o, Jump_o;
output [1:0] ALUOp_o;
reg RegWrite_o, MemtoReg_o, Branch_o, MemRead_o, MemWrite_o, RegDst_o, ALUSrc_o, Jump_o;
reg [1:0] ALUOp_o;

always@(Op_i)begin
    case( Op_i )
	6'b000000: begin // R-type
		RegWrite_o <= 1'b1;
		MemtoReg_o <= 1'b0;
		Branch_o <= 1'b0;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b0;
		RegDst_o <= 1'b1;
		ALUOp_o <= 2'b11;
		ALUSrc_o <= 1'b0;
		Jump_o <= 1'b0;
	end

	6'b001000: begin // addi
		RegWrite_o <= 1'b1;
		MemtoReg_o <= 1'b0;
		Branch_o <= 1'b0;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b0;
		RegDst_o <= 1'b0;
		ALUOp_o <= 2'b00;
		ALUSrc_o <= 1'b1;
		Jump_o <= 1'b0;
	end

	6'b100011: begin // lw
		RegWrite_o <= 1'b1;
		MemtoReg_o <= 1'b1;
		Branch_o <= 1'b0;
		MemRead_o <= 1'b1;
		MemWrite_o <= 1'b0;
		RegDst_o <= 1'b0;
		ALUOp_o <= 2'b00;
		ALUSrc_o <= 1'b1;
		Jump_o <= 1'b0;
	end

	6'b101011: begin // sw
		RegWrite_o <= 1'b0;
		MemtoReg_o <= 1'b0;
		Branch_o <= 1'b0;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b1;
		RegDst_o <= 1'b0;
		ALUOp_o <= 2'b00;
		ALUSrc_o <= 1'b1;
		Jump_o <= 1'b0;
	end

	6'b000100: begin // beq
		RegWrite_o <= 1'b0;
		MemtoReg_o <= 1'b0;
		Branch_o <= 1'b1;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b0;
		RegDst_o <= 1'b0;
		ALUOp_o <= 2'b01;
		ALUSrc_o <= 1'b0;
		Jump_o <= 1'b0;
	end

	6'b000010: begin // jump
		RegWrite_o <= 1'b0;
		MemtoReg_o <= 1'b0;
		Branch_o <= 1'b0;
		MemRead_o <= 1'b0;
		MemWrite_o <= 1'b0;
		RegDst_o <= 1'b0;
		ALUOp_o <= 2'b00;
		ALUSrc_o <= 1'b0;
		Jump_o <= 1'b1;
	end

	default: $display("Invalid Op signal");
	endcase
end

endmodule
