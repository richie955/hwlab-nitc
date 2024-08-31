module d_latch (
    input D, R, E,
    output Qn, Q
);
    wire Dn, x, y, Q_inter;
    
    not (Dn, D);
    
    nand (x, D, E);
    nand (y, Dn, E);
    
    nand (Q_inter, x, Qn);
    and (Q, Q_inter, R);  
    
    nand (Qn, y, Q);

endmodule

module B230519CS_RICHIE_4 (
    input [7:0] D,
    input R, E,
    output [7:0] Qn,
    output [7:0] Q
);
 
    d_latch d0 (D[0], R, E, Qn[0], Q[0]);
    d_latch d1 (D[1], R, E, Qn[1], Q[1]);
    d_latch d2 (D[2], R, E, Qn[2], Q[2]);
    d_latch d3 (D[3], R, E, Qn[3], Q[3]);
    d_latch d4 (D[4], R, E, Qn[4], Q[4]);
    d_latch d5 (D[5], R, E, Qn[5], Q[5]);
    d_latch d6 (D[6], R, E, Qn[6], Q[6]);
    d_latch d7 (D[7], R, E, Qn[7], Q[7]);
    
endmodule



