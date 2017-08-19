// Mail box for information sharing between treads

module test;

  typedef enum {ADD=1, SUB, MUL, DIV} instr_e;
  mailbox #(instr_e) mbox;

  initial begin
    instr_e instr = MUL, instr2;
    mbox = new(1);
    mbox.put(instr);
    mbox.get(instr2);
    $display("\n****************************************");
    $display("instr2 = %s", instr2.name());
  end

endmodule
