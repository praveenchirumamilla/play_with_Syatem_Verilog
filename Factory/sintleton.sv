module test;

  class pravClass;
    protected static pravClass obj = get();
  
    static function pravClass get();
      if(obj == null)
        obj = new();

      return obj;
    endfunction

    extern virtual function void printMsg(string msg);
  endclass

  function void pravClass::printMsg(string msg);
    $display("\n***************************************");
    $display("%s", msg);
  endfunction
  pravClass pravObj = pravClass::get();
  pravClass pravObj2 = pravClass::get();

  initial
  begin
    pravObj.printMsg("Hello Praveen");
    
    pravObj2.printMsg("Hi Praveen");
  end
endmodule
