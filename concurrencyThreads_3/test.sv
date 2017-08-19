module test;
  
  initial begin
    for(int i = 0; i < 5; i++)begin
      automatic int k = i;
      fork 
        begin
          #10ns;
          $display("k = %0d", k);
        end
      join_none
  
    end
  end

endmodule
