// A simple ALU
typedef logic [4:0] define_type;
module alu (
  input     logic [31:0]   a_i,
  input     logic [31:0]   b_i,
  define_type   op_i,

  output    logic [31:0]   alu_o
);

  define_type  OP_ADD = 0;
  define_type  OP_SUB = 1;
  define_type  OP_SLL = 2;
  define_type  OP_SRA = 3;
  define_type  OP_AND = 4;
  define_type  OP_OR  = 5;
  define_type  OP_XOR = 6;
  define_type  OP_EQL = 7;
  define_type  OP_LESSEQL=8;
  define_type  OP_GREQL=9;
  define_type  OP_NEQL=10;
  define_type  OP_JAL_JALR=31;

  logic a=0;

  function void print();
    $display("The Value of result =",alu_o);
  endfunction
  
  always_comb begin
    alu_o=(op_i==OP_ADD)?a_i+ b_i:
          (op_i==OP_SUB)?a_i-b_i:
          (op_i==OP_SLL)?a_i[7:0]<<b_i[2:0]:
          (op_i==OP_SRA)?a_i[7:0]>>>b_i[2:0]:
          (op_i==OP_AND)?a_i[7:0]&b_i[7:0]:
          (op_i==OP_OR)?a_i | b_i:
          (op_i==OP_XOR)?a_i ^ b_i:
          (op_i==OP_EQL)?{7'h0, a_i == b_i}:
          (op_i==OP_LESSEQL)?{7'h0, a_i <= b_i}:
          (op_i==OP_GREQL)?{7'h0, a_i >= b_i}:
          (op_i==OP_NEQL)?{7'h0, a_i != b_i}:
          (op_i==OP_JAL_JALR)?a_i:a;
    print();
    
  end

endmodule
module alu_tb ();

  logic [31:0] a_i;
  logic [31:0] b_i;
  logic [4:0] op_i;
  logic [31:0] alu_o;

  alu ALU (.*);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  initial begin
    for (int j =0; j<2; j++) begin
      for (int i =0; i<=31; i++) begin
        a_i =32'(i+1);
        b_i = 32'(i);
        op_i = 5'(i);
        #5;
      end
    end
  end
endmodule
