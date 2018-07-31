module ALU_Control (funct_i, ALUOp_i, ALUCtrl_o);

input [5:0] funct_i;
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;
reg [2:0] ALUCtrl_o;

always @ ( * ) begin
  case( ALUOp_i )
    2'b00: begin //add
      ALUCtrl_o = 3'b000; //add 000
    end
    2'b01: begin // sub
      ALUCtrl_o = 3'b001; // sub 001
    end
    2'b10: begin // or
      ALUCtrl_o = 3'b100; // or 100
    end
    2'b11: begin
      case (funct_i)
        6'b100000: ALUCtrl_o = 3'b000;  //add 000
        6'b100010: ALUCtrl_o = 3'b001;  //sub 001
        6'b011000: ALUCtrl_o = 3'b010;  //mul 010
        6'b100100: ALUCtrl_o = 3'b011;  //and 011
        6'b100101: ALUCtrl_o = 3'b100;  //or 100
        default:   ALUCtrl_o = 3'b000;  //don't care
      endcase
    end
    default:;
  endcase
end

endmodule
