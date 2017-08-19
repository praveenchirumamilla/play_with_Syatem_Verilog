module test;

  event A;
  task my_task1();
    wait(A.triggered);
    $display("print later");
  endtask

  task my_task2();
    $display("print first");
    ->A;
  endtask

  initial begin
    $display("\n***********************************")
    fork
      my_task1();
      my_task2();
    join
  end
endmodule
