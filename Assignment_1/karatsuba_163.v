module karatsuba_163(A,B,C);
    input wire[162:0] A,B;
    output wire[324:0] C;

    wire[81:0] Al, Bl;
    wire[81:0] Ah, Bh;

    assign {Al, Bl, Ah, Bh} = {A[81:0], B[81:0], {{1'b0}, A[162:82]}, {{1'b0}, B[162:82]}};

    wire[81:0] Al_plus_Ah,Bl_plus_Bh; 

    assign Al_plus_Ah = Al ^ Ah;
    assign Bl_plus_Bh = Bl ^ Bh;

    wire[162:0] c1,c2,c3, temp;

    karatsuba_81 k1(Al,Bl,c1);  // c1 is Al*Bl
    karatsuba_81 k2(Ah,Bh,c2);  // c2 is Ah*Bh
    karatsuba_81 k3(Al_plus_Ah,Bl_plus_Bh,c3);  // c3 is the other one

    // now combining all the other terms together
    // 0 exteding c1 c2 and c3
    wire[324:0] low, mid, high;

    // there may be a need to omit this step if register assigning from a particular step is possible
    assign temp = c3 ^ c2 ^ c1;
    assign low = {{162{1'b0}}, c1}; 
    assign mid = {{80{1'b0}}, temp, {82{1'b0}}}; 
    assign high = {c2, {164{1'b0}}}; 

    // reg[324:0] answer = low ^ mid ^ high;
    assign C = low ^ mid ^ high;
endmodule

module karatsuba_81(A,B,C);
    input wire[81:0] A,B;
    output wire[162:0] C;

    wire[40:0] Al, Bl;
    wire[40:0] Ah, Bh;

    assign {Al, Bl, Ah, Bh} = {A[40:0], B[40:0], {A[81:41]}, {B[81:41]}};

    wire[40:0] Al_plus_Ah,Bl_plus_Bh; 

    assign Al_plus_Ah = Al ^ Ah;
    assign Bl_plus_Bh = Bl ^ Bh;

    wire[80:0] c1,c2,c3, temp;

    karatsuba_40 k1(Al,Bl,c1);  // c1 is Al*Bl
    karatsuba_40 k2(Ah,Bh,c2);  // c2 is Ah*Bh
    karatsuba_40 k3(Al_plus_Ah,Bl_plus_Bh,c3);  // c3 is the other one

    // now combining all the other terms together
    // 0 exteding c1 c2 and c3
    wire[162:0] low, mid, high;

    // there may be a need to omit this step if register assigning from a particular step is possible
    assign temp = c3 ^ c2 ^ c1;
    assign low = {{82{1'b0}}, c1}; 
    assign mid = {{41{1'b0}}, temp, {41{1'b0}}}; 
    assign high = {c2, {82{1'b0}}}; 

    // reg[162:0] answer = low ^ mid ^ high;
    // answer = low ^ mid ^ high;
    assign C = low ^ mid ^ high;
endmodule

module karatsuba_40(A,B,C);
    input wire[40:0] A,B;
    output wire[80:0] C;

    wire[20:0] Al, Bl;
    wire[20:0] Ah, Bh;

    assign {Al, Bl, Ah, Bh} = {{{1'b0},A[19:0]}, {{1'b0},B[19:0]}, A[40:20], B[40:20]};

    wire[20:0] Al_plus_Ah,Bl_plus_Bh; 

    assign Al_plus_Ah = Al ^ Ah;
    assign Bl_plus_Bh = Bl ^ Bh;

    wire[40:0] c1,c2,c3, temp;

    karatsuba_20 k1(Al,Bl,c1);  // c1 is Al*Bl
    karatsuba_20 k2(Ah,Bh,c2);  // c2 is Ah*Bh
    karatsuba_20 k3(Al_plus_Ah,Bl_plus_Bh,c3);  // c3 is the other one

    // now combining all the other terms together
    // 0 exteding c1 c2 and c3
    wire[80:0] low, mid, high;

    // there may be a need to omit this step if register assigning from a particular step is possible
    assign temp = c3 ^ c2 ^ c1;
    assign low = {{40{1'b0}}, c1}; 
    assign mid = {{20{1'b0}}, temp, {20{1'b0}}}; 
    assign high = {c2, {40{1'b0}}}; 

    // reg[80:0] answer = low ^ mid ^ high;
    // answer = low ^ mid ^ high;
    assign C = low ^ mid ^ high;
endmodule

module karatsuba_20(A,B,C);
    input wire[20:0] A,B;
    output wire[40:0] C;

    wire[10:0] Al, Bl;
    wire[10:0] Ah, Bh;

    assign {Al, Bl, Ah, Bh} = {{{1'b0},A[9:0]}, {{1'b0},B[9:0]}, A[20:10], B[20:10]};

    wire[10:0] Al_plus_Ah,Bl_plus_Bh; 

    assign Al_plus_Ah = Al ^ Ah;
    assign Bl_plus_Bh = Bl ^ Bh;

    wire[20:0] c1,c2,c3, temp;

    karatsuba_10 k1(Al,Bl,c1);  // c1 is Al*Bl
    karatsuba_10 k2(Ah,Bh,c2);  // c2 is Ah*Bh
    karatsuba_10 k3(Al_plus_Ah,Bl_plus_Bh,c3);  // c3 is the other one

    // now combining all the other terms together
    // 0 exteding c1 c2 and c3
    wire[40:0] low, mid, high;

    // there may be a need to omit this step if register assigning from a particular step is possible
    assign temp = c3 ^ c2 ^ c1;
    assign low = {{20{1'b0}}, c1}; 
    assign mid = {{10{1'b0}}, temp, {10{1'b0}}}; 
    assign high = {c2, {20{1'b0}}}; 

    // reg[40:0] answer = low ^ mid ^ high;
    // answer = low ^ mid ^ high;
    assign C = low ^ mid ^ high;
endmodule

module karatsuba_10(A,B,C);
    input wire[10:0] A,B;
    output wire[20:0] C;

    wire[5:0] Al, Bl;
    wire[5:0] Ah, Bh;

    assign {Al, Bl, Ah, Bh} = {{{1'b0},A[4:0]}, {{1'b0},B[4:0]}, A[10:5], B[10:5]};

    wire[5:0] Al_plus_Ah,Bl_plus_Bh; 

    assign Al_plus_Ah = Al ^ Ah;
    assign Bl_plus_Bh = Bl ^ Bh;

    wire[10:0] c1,c2,c3, temp;

    karatsuba_5 k1(Al,Bl,c1);  // c1 is Al*Bl
    karatsuba_5 k2(Ah,Bh,c2);  // c2 is Ah*Bh
    karatsuba_5 k3(Al_plus_Ah,Bl_plus_Bh,c3);  // c3 is the other one

    // assign C = {{10{1'b0}},c3};

    // now combining all the other terms together
    // 0 exteding c1 c2 and c3
    wire[20:0] low, mid, high;

    // there may be a need to omit this step if register assigning from a particular step is possible
    assign temp = c3 ^ c2 ^ c1;
    assign low = {{10{1'b0}}, c1}; 
    assign mid = {{5{1'b0}}, temp, {5{1'b0}}}; 
    assign high = {c2, {10{1'b0}}}; 


    // assign C = high;
    // reg[20:0] answer = low ^ mid ^ high;
    // answer = low ^ mid ^ high;
    assign C = low ^ mid ^ high;
endmodule

module karatsuba_5(A,B,C);
    // base module
    input wire[5:0] A,B;
    output wire[10:0] C;

    assign C = A*B;
endmodule