module test;

  bit [3:0] [7:0] arr1;

  // packed array
  bit [3:0] [7:0] arr2[5];
  bit [3:0][3:0][3:0] test[3][3];

  // pack & unpack arrays
  bit [7:0] a1, a2,a3;
  bit [23:0] packArr;
  bit [7:0] unpackArr[3];

  initial begin
    $display("***********************************************************************");
    for(int i = 0; i < 5; i++) begin
      arr2[i] = 32'hdead0000 + i;
    end

    arr1 = arr2[$urandom_range(0,4)];

    $display("arr1=0x%0x", arr1);
    for(int i = 0; i < 5; i++) begin
      $display("arr2[%0d]=0x%0b", i,  arr2[i]);
      for(int j = 0; j < 4; j++) begin
        $display("arr2[%0d][%0d]=0x%0b", i, j, arr2[i][j]);
      end
    end

    $display("\ndimentions of test = %0d", $dimensions(test));
    test[0][0] = 64'hdeadbeafdeadbeaf;
    test[0][1] = 64'habcdabcdabcdabcd;
    test[0][2] = 64'hdeafdeafdeafdeaf;
    $display("test = 0x%0x_%0x_%0x", test[0][2], test[0][1],test[0][0]);

    $display("\npack & unpack an array");
    a1 = 8'hab;
    a2 = 8'hcd;
    a3 = 8'hef;

    packArr = {>>{a1, a2, a3}};
    {unpackArr[2], unpackArr[1], unpackArr[0]} = {>>{packArr}};
    $display("packed array = %0x", packArr);
    $display("un packed array = %0x_%0x_%0x", unpackArr[2], unpackArr[1], unpackArr[0]);
    $display("***********************************************************************");
  end

endmodule
