module memB
  #(
    parameter BITS_AB=8,
    parameter DIM=8
    )
   (
    input                      clk,rst_n,en,
    input signed [BITS_AB-1:0] Bin [DIM-1:0],
    output signed [BITS_AB-1:0] Bout [DIM-1:0]
    );

  genvar x;
  generate
    for (x=0; x<DIM; x=x+1) begin
      fifo     #(.DEPTH(DIM+x), 
                .BITS(BITS_AB))
      mem_fifos(.clk(clk),
                .rst_n(rst_n),
                .en(en),
                .d(Bin[x]),
                .q(Bout[x]));
    end
  endgenerate

endmodule
