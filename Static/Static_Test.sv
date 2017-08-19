module staticTest;

  function incNum(int id);
    int num = 15;

    repeat(5) begin
      num++;
      $display("id=%0d, num=%0d", id, num);
    end
  endfunction

  function forkFunction();
    fork
      incNum(0);
      incNum(1);
      incNum(2);
    join_none
  endfunction

  initial begin
    forkFunction();
  end

endmodule
