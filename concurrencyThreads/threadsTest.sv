module test;
  int a = 0, b = 1;

  task disp(int j);
    fork
      begin
        $display("%0d", j);
        #1ns;
      end
    join_none

  endtask

  initial begin

    // Scenario -1 
    fork 
      begin
        int d = 3;
        a = b + d;
      end

      begin
        int e = 4;
        b = a + e;
      end
    join
    $display("\n******************************************");
    $display("a =%0d",a);  // a = 4
    $display("b =%0d",b);  // b = 8
    
    // Scenario -2
    $display("\n******************************************");
    for(int i = 0; i < 16; i++) begin 
      disp(i);
      wait fork;
    end

    // Scenario - 3
    $display("\n*******************************************");
    //for(int j = 0; j < 16; j++) begin
    //  int index = j;
    //  fork
    //    disp(index);
    //  join_none
    //end
    wait fork;
  end


endmodule
