module test;
  reg clk;
  reg req, rst;
  wire ack;

  always begin
    #5 clk = ~clk;
  end

  dut dut_a(clk, rst, req, ack);

  initial begin
      clk <= 0;
      rst <= 1;
      req <= 0;
    #15;
    @(posedge clk);
      rst <= 0;
    #10;
    @(posedge clk);
      req <= 1;
    #1;
      req <= 0;

    $finish;
  end
 
 // property rst_to_count;
 //   @(posedge clk) rst |-> !ack;
 // endproperty

 // assert property (rst_to_count);

endmodule
