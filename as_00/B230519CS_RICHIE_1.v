module half_add(a,b,y,cout);
input a,b;
output y,cout;
xor(y,a,b);
and(cout,a,b);
endmodule

module full_add(a,b,cin,sum,cout);
input a,b,cin;
wire w1,w2;
output sum,cout;
half_add a1(a,b,w1,w2);
half_add a2(w1,cin,sum,w3);
or(cout,w3,w2);
endmodule

module B230519CS_RICHIE_1(a,b,cin,cout,sum);
input [7:0]a,b;
input cin;
output cout;
output [7:0]sum;
wire [7:0] carry;  


 full_add fa0(a[0],b[0],cin,sum[0],carry[0]);
 full_add fa1(a[1],b[1],carry[0],sum[1],carry[1]);
 full_add fa2(a[2],b[2],carry[1],sum[2],carry[2]);
 full_add fa3(a[3],b[3],carry[2],sum[3],carry[3]);
 full_add fa4(a[4],b[4],carry[3],sum[4],carry[4]);
 full_add fa5(a[5],b[5],carry[4],sum[5],carry[5]);
 full_add fa6(a[6],b[6],carry[5],sum[6],carry[6]);
 full_add fa7(a[7],b[7],carry[6],sum[7],cout);

endmodule


