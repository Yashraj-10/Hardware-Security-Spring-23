module multiplier_gf163(
    input [162:0] a,
    input [162:0] b,
    output[162:0] out
);

wire [324:0] d;

karatsuba_163 uut1(.A(a), .B(b), .C(d));
reducer uut2(.a(d), .d(out));

endmodule