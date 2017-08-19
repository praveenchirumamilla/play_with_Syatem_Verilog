module test;
  // task A runs for 50us
  task run_a;
    while($time < 50us) begin
      #1us;
      $display("running task A at time : %g", $time);
    end
  endtask

  // task B runs for 5us
  task run_b;
    #5us;
    $display("running task B at time : %g", $time);
  endtask

  // task C runs for 10 us
  task run_c;
    #10us;
    $display("running task C at time : %g", $time);
  endtask

  initial begin
    process pa;
    process pb;
    process pc;
    fork
      //pa = process::self();
      run_a();
    join_none

    fork 
      //pb = process::self();
      run_b();
      //pc = process::self();
      run_c();
    join_any

    //wait fork;
    //if(pa.status() != process::FINISHED) begin
    //  $display("killing process C");
    //  pc.kill();
    //end

    $display("time before disable fork : %g", $time);
    disable fork;
    #10us;
    //$finish;
  end


endmodule
