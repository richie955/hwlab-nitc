// module B230519CS_RICHIE_3_tb;

//     reg [7:0] a, b;
//     reg [1:0] sel;
//     wire [8:0] y;

 
//     B230519CS_RICHIE_3 t (
//         .a(a),
//         .b(b),
//         .sel(sel),
//         .y(y)
//     );

//     initial begin
//         // Initialize inputs
//         a = 8'b00111111;
//         b = 8'b00000011;

//         // Test addition
//         sel = 2'b00;
//         #10;
//         $display("Addition: %b + %b = %b, Carry = %b", a, b, y[7:0], y[8]);

//         // Test subtraction
//         sel = 2'b01;
//         #10;
//         $display("Subtraction: %b - %b = %b, Borrow = %b", a, b, y[7:0], y[8]);

//         // Test left shift
//         sel = 2'b10;
//         #10;
//         $display("Left Shift: %b << 1 = %b", a, y[7:0]);

//         // Test XOR
//         sel = 2'b11;
//         #10;
//         $display("XOR: %b ^ %b = %b", a, b, y[7:0]);

//         // End simulation
//         $stop;
//     end

// endmodule

module ALU_tb;
	reg [7:0]a,b;
	reg [1:0]sel;
	wire [8:0]out;
	
	 B230519CS_RICHIE_3 al(a,b,sel,out);
	
	
	integer i,j,k;
	
	initial begin
	$monitor("a=%b,b=%b,sel=%b,out=%b\n",a,b,sel,out);
	for(k=0;k<4;k=k+1)
		begin
		for(i=0;i<256;i=i+1)
			begin
			for(j=0;j<256;j=j+1)
				begin
				a=i;b=j;sel=k;
				#10;
				end
			end
		end
	end
	endmodule
