module test;
  class a;
    function dojob1();
      $display("a::dojob1");
    endfunction

    virtual function dojob2();
      $display("a::dojob2");
    endfunction
  endclass

  class b extends a;
    
      function dojob1();
        $display("b::dojob1");
      endfunction

      virtual function dojob2();
        $display("b::dojob2");
      endfunction
  endclass

  a a1, a2;
  b b1, b2;

  initial begin

    a1 = new();
    b1 = new();
    
    $display("\n***********************************************");
    // base class a
    a1.dojob1();
    a1.dojob2();

    // extended class b
    b1.dojob1();
    b1.dojob2();

    // class b assigned to class a
    a2 = b1;
    a2.dojob1();
    a2.dojob2();

    // class a assigned to class b **** the following results in compilation error ***
    //b2 = a1;
    //b2.dojob1();
    //b2.dojob2();


    $display("\n***********************************************");
  end


endmodule
