module tb_jpeg;

reg clk_fast;
reg [15:0] left_s;
reg [15:0] right_s;
reg [15:0] sam_s;
wire [15:0] res_s;
reg lo_hi_s;
reg fwd_inv_s;

initial begin
    $from_myhdl(
        clk_fast,
        left_s,
        right_s,
        sam_s,
        lo_hi_s,
        fwd_inv_s
    );
    $to_myhdl(
        res_s
    );
end

jpeg dut(
    clk_fast,
    left_s,
    right_s,
    sam_s,
    res_s,
    lo_hi_s,
    fwd_inv_s
);

endmodule
