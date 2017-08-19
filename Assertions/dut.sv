module dut(input clk, rst, req, output ack);
reg ack;
reg [1:0] count;

always @(posedge clk) begin
  if(rst) begin
    count <= 0;
    ack <= 0;
  end
  else begin
    if(req) begin
    ack <= 1;
    end
  end
end


//assert property @(posedge clk) rst |-> (count == 0);
//assert property (@(posedge clk) rst |-> (ack == 0));

//always @(posedge clk) begin
//  if(rst)
//    assert (count == 0);
//end


endmodule
