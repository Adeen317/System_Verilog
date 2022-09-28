// Simple ALU TB

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
      for (int i =0; i<31; i++) begin
        a_i =32'(i+1);
        b_i = 32'(i);
        op_i = 5'(i);
        #5;
      end
    end
  end
endmodule