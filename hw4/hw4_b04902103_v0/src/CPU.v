module CPU(
    clk_i,
    rst_i,
    start_i
);

// Ports
input clk_i;
input rst_i;
input start_i;

wire [31:0] instr_addr, instr;
wire [31:0] pc;
wire [5:0] opcode, funct_i;
wire [4:0] rs, rt, rd;
wire [15:0] imm;
assign opcode = instr[31:26];
assign rs = instr[25:21];
assign rt = instr[20:16];
assign rd = instr[15:11];
assign funct_i = instr[5:0];
assign imm = instr[15:0];
wire [31:0] rs_data, rt_data;
wire zero_o;

Control Control(
    .Op_i       (opcode),
    .RegDst_o   (MUX_RegDst.select_i),
    .ALUOp_o    (ALU_Control.ALUOp_i),
    .ALUSrc_o   (MUX_ALUSrc.select_i),
    .RegWrite_o (Registers.RegWrite_i)
);


Adder Add_PC(
    .data1_i    (instr_addr),
    .data2_i    (32'd4),
    .data_o     (pc)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (pc),
    .pc_o       (instr_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (instr_addr),
    .instr_o    (instr)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (rs),
    .RTaddr_i   (rt),
    .RDaddr_i   (MUX_RegDst.data_o),
    .RDdata_i   (ALU.data_o),
    .RegWrite_i (Control.RegWrite_o),
    .RSdata_o   (rs_data),
    .RTdata_o   (rt_data)
);


MUX5 MUX_RegDst(
    .data1_i    (rt),
    .data2_i    (rd),
    .select_i   (Control.RegDst_o),
    .data_o     (Registers.RDaddr_i)
);



MUX32 MUX_ALUSrc(
    .data1_i    (rt_data),
    .data2_i    (Sign_Extend.data_o),
    .select_i   (Control.ALUSrc_o),
    .data_o     (ALU.data2_i)
);


Sign_Extend Sign_Extend(
    .data_i     (imm),
    .data_o     (MUX_ALUSrc.data2_i)
);


ALU ALU(
    .data1_i    (rs_data),
    .data2_i    (MUX_ALUSrc.data_o),
    .ALUCtrl_i  (ALU_Control.ALUCtrl_o),
    .data_o     (Registers.RDdata_i),
    .Zero_o     (Zero_o)
);


ALU_Control ALU_Control(
    .funct_i    (funct_i),
    .ALUOp_i    (Control.ALUOp_o),
    .ALUCtrl_o  (ALU.ALUCtrl_i)
);


endmodule
