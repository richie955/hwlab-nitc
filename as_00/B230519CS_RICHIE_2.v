module half_sub(a, b, diff, borrow);
input a, b;
output diff, borrow;
wire not_a;
xor(diff, a, b);
not(not_a, a);
and(borrow, not_a, b);
endmodule

module full_sub(a, b, bin, diff, bout);
input a, b, bin;
output diff, bout;
wire w1, w2, w3;

half_sub hs1(a, b, w1, w2);
half_sub hs2(w1, bin, diff, w3);
or(bout, w2, w3);

endmodule

module B230519CS_RICHIE_2(a, b, bin, diff, bout);
input [7:0] a, b;
input bin;  // Borrow-in
output [7:0] diff;
output bout;  // Final Borrow-out
wire [6:0] borrow;

full_sub fs0(a[0], b[0], bin, diff[0], borrow[0]);
full_sub fs1(a[1], b[1], borrow[0], diff[1], borrow[1]);
full_sub fs2(a[2], b[2], borrow[1], diff[2], borrow[2]);
full_sub fs3(a[3], b[3], borrow[2], diff[3], borrow[3]);
full_sub fs4(a[4], b[4], borrow[3], diff[4], borrow[4]);
full_sub fs5(a[5], b[5], borrow[4], diff[5], borrow[5]);
full_sub fs6(a[6], b[6], borrow[5], diff[6], borrow[6]);
full_sub fs7(a[7], b[7], borrow[6], diff[7], bout);

endmodule

