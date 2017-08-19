module test;

  class ArraysTest;
    //fixed size arrays
    int fixedSizeArray[25];

    //Dynamic Array
    int dynamicArray[];

    //Associate Array
    int assocArray[int];

    //Queue
    int queueArray[$];

    extern function new();
    extern virtual function void print();
    extern virtual function void findIndex(int value);
  endclass

  function ArraysTest::new();
    int val;
    int ind;
    dynamicArray = new[25];
    for(int i = 0; i < 25; i++) begin
      val = $urandom_range(1,50);
      fixedSizeArray[i] = val;
      dynamicArray[i] = val;
      queueArray.push_back(val);

      do begin
        ind = $urandom_range(1,200);
      end while(assocArray.exists(ind));
      assocArray[ind] = val;
    end
  endfunction: new

  function void ArraysTest::print();
    $display("fixed size arrays:");
    foreach(fixedSizeArray[i]) begin
      $display("fixedSizeArray[%0d] = %0d",i,fixedSizeArray[i]);
    end

    $display("dynamic arrays:");
    foreach(dynamicArray[i]) begin
      $display("dynamicArray[%0d] = %0d",i,dynamicArray[i]);
    end

    $display("queue Arrays:");
    foreach(queueArray[i]) begin
      $display("queueArray[%0d] = %0d", i, queueArray[i]);
    end

    $display("Assoc Arrays:");
    foreach(assocArray[i]) begin
      $display("assocArray[%0d] = %0d", i, assocArray[i]);
    end
  endfunction: print
  
  function void ArraysTest::findIndex(int value);
    int fixed[$];
    int dynamic[$];
    int queue[$];
    int assoc[$];

    fixed = fixedSizeArray.find_index with (item == value);
    dynamic = dynamicArray.find_index with (item == value);
    queue = queueArray.find_index with (item == value);
    assoc = assocArray.find_index with (item == value);

    $display("fixed matches: ");
    foreach(fixed[i]) begin
      $display("%0d", fixed[i]);
    end

    $display("dynamic matches: ");
    foreach(dynamic[i]) begin
      $display("%0d", dynamic[i]);
    end

    $display("Q matches: ");
    foreach(queue[i]) begin
      $display("%0d", queue[i]);
    end

    $display("Assoc matches: ");
    foreach(assoc[i]) begin
      $display("%0d", assoc[i]);
    end
  endfunction

  /* -------------------------------------------------------- */
  /* ------------------ test -------------------------------- */
  /* -------------------------------------------------------- */
  ArraysTest tmp;

  initial begin
    tmp = new();
    tmp.print();
    tmp.findIndex(36);
  end


endmodule
