module test;
  reg clk, a;
  logic out1, out2;

  // clock generation
  always begin
    #5 clk = ~clk;
  end

  // stimulus generation
  initial begin
    clk = 0;
    a = 0;
    #10;
    @(posedge clk)
    a = 1;
    #10;
    a = 0;
    $finish;
  end
  
  fsm fsm_inst(clk, a, out1, out2);

  //assert property @(posedge clk) a |=> (out1 || out2);
  //assert property @(posedge clk) a |-> (out2);
endmodule
