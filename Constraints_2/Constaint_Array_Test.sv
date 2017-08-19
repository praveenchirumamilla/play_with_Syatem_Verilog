module test;
  class oneDimArray;
    rand int arr[]; // dynamic array 1-dimentional

    constraint arr_const {
      arr.size() < 10;
      foreach(arr[i]) {
        arr[i] < 30;
        arr[i] > 20;
      }
    }

    function print();
      $display("one dim array:");
      foreach(arr[i]) begin
        $display("arr[%0d] = %0d", i, arr[i]);
      end
    endfunction
  endclass

  class twoDimeArray;
    rand int twoDArr[][]; // dynamic array 2-dimentional

    constraint twoD_Arr{
      twoDArr.size() == 5;
      foreach(twoDArr[i]) {
        twoDArr[i].size() == 3;
      }

      foreach(twoDArr[i, j]){
        twoDArr[i][j] < 15;
        twoDArr[i][j] > 5;
      }
    }

    function print();
      $display("twoDArr size = %0d", twoDArr.size());
      foreach(twoDArr[i]) begin
        $display("  twoDArr[%0d].size = %0d", i, twoDArr[i].size());
        foreach(twoDArr[i][j]) begin
          $display("    twoDArr[%0d][%0d] = %0d", i, j, twoDArr[i][j]);
        end
      end
    endfunction

  endclass

  oneDimArray oneD;
  twoDimeArray twoD;

  initial begin
    $display("*********************************************");
    oneD = new();
    oneD.randomize();
    oneD.print();

    twoD = new();
    twoD.randomize();
    twoD.print();

  end

endmodule
