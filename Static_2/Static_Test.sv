module staticTest;

  class staticClass;
    
    function int foo(int a = 1);
      foo = 3;
    endfunction

    // static method, argument& internal variables are automatic
    static function int foo_static_1(int a = 1); 
      foo_static_1 = 3;
    endfunction

    // static method & internal arguments are static
    static function static int foo_static_2(int a = 1);
      int b;
      foo_static_2 = 3;
    endfunction

    // staic method, arguments & internal variables are static
    static task static foo_static_task(int a = 1);
      int b;
      $display("Start task, at time %0d val of a = %0d b = %0d", $time, a, b);
      #2;
      $display("End task, at time %0d val of a = %0d b = %0d", $time, a, b);
    endtask

  endclass
  
  staticClass temp;
  initial begin
    $display("****************************************************");
    fork
      staticClass::foo_static_task();
    join_none
    #1
    staticClass::foo_static_task.a = 50;
    staticClass::foo_static_task.b = 100;
    #2
    $display("****************************************************");
  end

endmodule







