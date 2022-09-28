typedef logic [3:0] count;
module bcd_te (
  input logic [3:0] in,
  output logic  a,b,c,d,e,f,g);

  count Zero = 0;
  count One =  1;
  count Two =  2;
  count Three= 3;
  count Four = 4;
  count Five = 5;
  count Six =  6;
  count Seven= 7;
  count Eight= 8;
  count Nine=  9;
always_comb begin
    case (in)
      Zero: begin a=1;b=1;c=1;d=1;e=1;f=1;g=0;end
      One: begin a=0;b=1;c=1;d=0;e=0;f=0;g=0; end
      Two: begin a=1;b=1;c=0;d=1;e=1;f=0;g=1; end
      Three: begin a=1;b=1;c=1;d=1;e=0;f=0;g=1; end
      Four: begin a=0;b=1;c=1;d=0;e=0;f=1;g=1; end
      Five: begin a=1;b=0;c=1;d=1;e=0;f=1;g=1; end
      Six: begin a=1;b=0;c=1;d=1;e=1;f=1;g=1; end
      Seven: begin a=1;b=1;c=1;d=0;e=0;f=0;g=0; end
      Eight:  begin a=1;b=1;c=1;d=1;e=1;f=1;g=1;end
      Nine: begin a=1;b=1;c=1;d=1;e=0;f=1;g=1; end
      default: begin a=1;b=1;c=1;d=1;e=1;f=1;g=0; end
    endcase
   end
endmodule

module Bcd_t ();

  logic [3:0] in;
  logic a,b,c,d,e,f,g;

  bcd_te Bcd_t (.*);

  initial begin
    for (int i=0; i<10; i++) begin
        in = i;
      #5;
    end 
    $finish();
    end

  initial begin
    $dumpfile("bcd_te.vcd");
    $dumpvars(1);
  end
endmodule
