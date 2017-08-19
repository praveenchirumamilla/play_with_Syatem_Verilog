module fsm(clk, a, out1, out2);
  input clk;
  input a;
  output out1;
  output out2;

  reg [2:0] state;

  // fsm state encodings
  parameter [2:0] IDLE = 3'b001;
  parameter [2:0] STATE_1 =  3'b010;
  parameter [2:0] FINAL = 3'b100;

  assign out1 = (state == STATE_1);
  assign out2 = (state == FINAL);

  // state transitions
  always @(posedge clk) begin
    case(state)
      IDLE: 
        if(a) begin
          state <= STATE_1;
        end
        else begin
          state <= IDLE;
        end
      STATE_1:
        if(a) begin
          state <= FINAL;
        end
        else begin
          state <= IDLE;
        end
      FINAL:
        if(a) begin
          state <= FINAL;
        end
        else begin
          state <= IDLE;
        end
      default:
        state <= IDLE;
    endcase
  end
  
endmodule
