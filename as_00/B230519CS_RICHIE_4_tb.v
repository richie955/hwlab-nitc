// module B230519CS_RICHIE_4_tb;

//     reg [7:0] D;
//     reg R, E;
//     wire [7:0] Qn, Q;

//     B230519CS_RICHIE_4 t (
//         .D(D),
//         .R(R),
//         .E(E),
//         .Qn(Qn),
//         .Q(Q)
//     );

//     integer i;
    
//     initial begin

//         R = 0; E = 0;
//         for (i = 0; i < 8; i = i + 1) begin
//             D = 8'b00000000;
//             #10;
//             D = 8'b00000001 << i;
//             #10;
//         end

//         R = 0; E = 1;
//         for (i = 0; i < 8; i = i + 1) begin
//             D = 8'b11111111;
//             #10;
//             D = 8'b00000001 << i;
//             #10;
//         end
        
//         R = 1; E = 1;
//         for (i = 0; i < 8; i = i + 1) begin
//             D = 8'b11111111;
//             #10;
//             D = 8'b00000001 << i;
//             #10;
//         end

//         R = 1; E = 0;
//         for (i = 0; i < 8; i = i + 1) begin
//             D = 8'b00000000;
//             #10;
//             D = 8'b11111111;
//             #10;
//         end

//         $finish;
//     end

//     initial begin
//         $monitor("Time=%0t | D=%b R=%b E=%b | Qn=%b Q=%b", $time, D, R, E, Qn, Q);
//     end

// endmodule

module B230519CS_RICHIE_4_tb;
	
	reg [7:0]D;
	reg E,R;
	wire [7:0]Q,Qn;
	
	B230519CS_RICHIE_4 dd(D,E,R,Q,Qn);
	
	integer i;
	initial begin
	$monitor("D=%b,Q=%b,Qn=%b E=%b R=%b\n",D,Q,Qn,E,R);
	
	for(i=0;i<256;i=i+1)
		begin
			D=i;E=1'b0;R=1'b0;
			#10;
			
		end
		
	for(i=0;i<256;i=i+1)
		begin
			D=i;E=1'b0;R=1'b1;
			#10;
			
		end
		
	for(i=0;i<256;i=i+1)
		begin
			D=i;E=1'b1;R=1'b0;
			#10;
			
		end
	
	for(i=0;i<256;i=i+1)
		begin
			D=i;E=1'b1;R=1'b1;
			#10;
			
		end
	
	
	end
	endmodule
