module test;

  // packet class
  typedef enum {low, med, high} addrType_e;
  class packet;
    rand bit [3:0] sa, da;
    rand bit [7:0] payload[];
    rand addrType_e atype;

    function new(int s = 3);
      payload = new[s];
    endfunction

    function void display();
      $display("sa = %0d, da = %0d", sa, da);
      $display("The payload size = %0d", payload.size());
      //$display("payload[] = %p" payload);
    endfunction

    constraint addr {
      sa == 10;
      (atype == low) -> da inside {[1:3]};
      (atype == med) -> da inside {[7:9]};
      (atype == high) -> da inside {[11:15]};
      //da inside {[1:3], 7, 9};
      payload.size() > 3;
      payload.size() < 8;
    }
  endclass

  // test
  initial begin
    packet pkt = new();
    //pkt.sa = 0;
    //pkt.sa.rand_mode(0);
    //pkt.addr.constraint_mode(0);
    $display("\n************************************");
    if(!pkt.randomize())
      $finish;
    pkt.display();
    if(!pkt.randomize())
      $finish;
    pkt.display();
  end

endmodule
