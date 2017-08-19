

module test;
typedef union packed {
  bit [63:0] bitSlice;
  bit [7:0][7:0] byteSliceData;
} u64dataType_e;

  class reverse;
    //u64dataType_e tempData;
    //u64dataType_e newData;
    bit [63:0] tempData, newData;


    function reverseData();
      //tempData.bitSlice = 64'hdeadbeaf;
      tempData = 64'hdeadbeaf;
      this.newData = 0;
      $display("Original Data : %0b", tempData);
      this.newData = {<<{tempData}};
      $display("Reversed Data: %0b", this.newData);
    endfunction
  endclass

  initial begin
    reverse cls = new();
    //cls.randomize();
    cls.reverseData();
  
  end

endmodule
