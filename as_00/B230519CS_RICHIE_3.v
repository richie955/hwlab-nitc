module leftshift(a,out);
	input [7:0] a;
	output [7:0]out;
	
	or(out[7],a[3],0);
	or(out[6],a[2],0);
	or(out[5],a[1],0);
	or(out[4],a[0],0);
	or(out[3],0,0);
	or(out[2],0,0);
	or(out[1],0,0);
	and(out[0],0,0);
endmodule

module xor_gate(a,b,out);
	input [7:0]a;
   input [7:0]b;
   output [7:0]out;

	xor(out[0],a[0],b[0]);
	xor(out[1],a[1],b[1]);
	xor(out[2],a[2],b[2]);
	xor(out[3],a[3],b[3]);
	xor(out[4],a[4],b[4]);
	xor(out[5],a[5],b[5]);
	xor(out[6],a[6],b[6]);
	xor(out[7],a[7],b[7]);
endmodule




module half_add(a,b,y,cout);
input a,b;
output y,cout;
xor(y,a,b);
and(cout,a,b);
endmodule

module full_add(a,b,cin,summ,cout);
input a,b,cin;
wire w1,w2;
output summ,cout;
half_add a1(a,b,w1,w2);
half_add a2(w1,cin,summ,w3);
or(cout,w3,w2);
endmodule

module adder(a,b,cin,cout,summ);
input [7:0]a,b;
input cin;
output cout;
output [7:0]summ;
wire [7:0] carry;  


 full_add fa0(a[0],b[0],cin,summ[0],carry[0]);
 full_add fa1(a[1],b[1],carry[0],summ[1],carry[1]);
 full_add fa2(a[2],b[2],carry[1],summ[2],carry[2]);
 full_add fa3(a[3],b[3],carry[2],summ[3],carry[3]);
 full_add fa4(a[4],b[4],carry[3],summ[4],carry[4]);
 full_add fa5(a[5],b[5],carry[4],summ[5],carry[5]);
 full_add fa6(a[6],b[6],carry[5],summ[6],carry[6]);
 full_add fa7(a[7],b[7],carry[6],summ[7],cout);

endmodule

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

module subtractor(a, b, bin, diff, bout);
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
module MUX_2x1(data0,data1,sel,out);
	input data0,data1,sel;
	output out;
	wire w0,w1,w2;
	not(w0,sel);
	and(w1,data0,w0);
	and(w2,data1,sel);
	or(out,w1,w2);
endmodule


module MUX_4x1(data0,data1,data2,data3,sel0,sel1,out);
	input data0,data1,data2,data3,sel0,sel1;
	output out;
	wire w1,w2;
	
	MUX_2x1 m0(data0,data1,sel0,w1);
	MUX_2x1 m1(data2,data3,sel0,w2);
	MUX_2x1 m3(w1,w2,sel1,out);	
endmodule

module B230519CS_RICHIE_3(
    input [7:0] a, b,
    input [1:0] sel,
    output [8:0] y
);

    wire cout, bout;
    wire [7:0] summ, diff, out1, out2;

    leftshift l0(a, out1);
    xor_gate x0(a, b, out2);
    adder a0(a, b, 1'b0, cout, summ);  
    subtractor s0(a, b, 1'b0, diff, bout);  

  
    MUX_4x1 mu0(summ[0], diff[0], out1[0], out2[0], sel[0], sel[1], y[0]);
    MUX_4x1 mu1(summ[1], diff[1], out1[1], out2[1], sel[0], sel[1], y[1]);
    MUX_4x1 mu2(summ[2], diff[2], out1[2], out2[2], sel[0], sel[1], y[2]);
    MUX_4x1 mu3(summ[3], diff[3], out1[3], out2[3], sel[0], sel[1], y[3]);
    MUX_4x1 mu4(summ[4], diff[4], out1[4], out2[4], sel[0], sel[1], y[4]);
    MUX_4x1 mu5(summ[5], diff[5], out1[5], out2[5], sel[0], sel[1], y[5]);
    MUX_4x1 mu6(summ[6], diff[6], out1[6], out2[6], sel[0], sel[1], y[6]);
    MUX_4x1 mu7(summ[7], diff[7], out1[7], out2[7], sel[0], sel[1], y[7]);
    MUX_4x1 mu8(cout, bout, 1'b0, 1'b0, sel[0], sel[1], y[8]);  

endmodule

