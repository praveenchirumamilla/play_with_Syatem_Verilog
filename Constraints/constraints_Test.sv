module test();
  
  class phoneNumber;
    typedef enum int {ORDINARY, EMERGENCY, EXTENSIONS} numberType_e;

    rand numberType_e numberType;
    rand bit [3:0] number[];

    // Norwegian mobile system
    constraint num_constraint {
      if(numberType == ORDINARY) {
        number.size() == 10;
        foreach(number[i]) {
          number[i] inside {[1:9]};
        }
        number[9] == 4;
        number[8] == 7;

      }
      else if(numberType == EMERGENCY) {
        number.size() == 3;
        number[2] == 1;
        number[1] == 1;
        number[0] == 3;
      } 
      else if(numberType == EXTENSIONS) {
        number.size == 4;
        foreach(number[i]) {
          number[i]inside {[0:9]};
        }
      }
    }

    function print();
      if(numberType == ORDINARY) begin
        $display("numberType = %s, number=+%0d%0d-%0d%0d%0d%0d-%0d%0d%0d%0d", numberType.name,  number[9], number[8], number[7], number[6], number[5], number[4], number[3], number[2], number[1], number[0]);

      end
      else if(numberType == EMERGENCY) begin
        $display("numberType = %s, number=%0d%0d%0d", numberType.name, number[2],number[1], number[0]);
      end
      else if(numberType == EXTENSIONS) begin
        $display("numberType = %s, number=%0d%0d%0d%0d", numberType.name, number[3], number[2],number[1], number[0]);
      end
    endfunction

  endclass


  /******************************************************/
  /*************** Packet Class *************************/
  /******************************************************/
  class packet;
    rand bit [31:0] addr;
    rand bit [7:0] data;

    rand bit [23:0] countOnes[$];
    rand int sumQ[$];
    rand int dynamicArray[];
    rand bit [7:0] uniqueArr[5];

    
    constraint count_ones {
      countOnes.size() == 5;
      foreach(countOnes[i]) {
        $countones(countOnes[i]) == 1;
      }
    }

    constraint unique_array {
     foreach(uniqueArr[i]) {
      foreach(uniqueArr[j]){
        if(i != j) {
          uniqueArr[i] != uniqueArr[j];
        }
       }
      }
    }

    constraint addr_constraint {
      addr > 0;
      addr < 32'hFFFFFFFF;
    }

    function print();
      $display("countOnes:");
      foreach(countOnes[i]) begin
        $display("countOnes[%0d] = 0x%0h", i, countOnes[i]);
      end
      $display("\n");
      $display("uniqueArr:");
      foreach(uniqueArr[i]) begin
        $display("uniqueArr[%0d] = 0x%0h", i, uniqueArr[i]);
      end
      $display("\n");
      $display("addr = 0x%0h", addr);
    endfunction
    
  endclass

    
  phoneNumber phone;
  packet p;

  initial begin
    phone = new();

    $display("************************************************************************");
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    phone.randomize();
    phone.print();
    $display("************************************************************************");

    p = new();
    p.randomize();
    p.print();
    $display("************************************************************************");
  end
endmodule
