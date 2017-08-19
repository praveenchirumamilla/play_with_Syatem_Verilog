module test;

  initial begin
    semaphore sem;
    sem = new();

    $display("\n*******************************************");
    if(!sem.try_get(2)) begin
      $display("Failed to get 2 keys");
    end
    sem.put(3);
    sem.get(2);
    if(sem.try_get(1)) begin
      $display("got 1 key");
    end
  end

endmodule
