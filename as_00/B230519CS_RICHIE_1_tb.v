module B230519CS_RICHIE_1_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg cin;

    wire cout;
    wire [7:0] sum;

    B230519CS_RICHIE_1 t1 (a,b,cin,cout,sum);

    initial begin

        a = 8'b00000000;
        b = 8'b00000000;
        cin = 0;

     
        #100;
        
        // Test Case 1
        a = 8'b00001010; // 10 in decimal
        b = 8'b00000101; // 5 in decimal
        cin = 0;
        #10; // Wait for 10 time units

        // Test Case 2
        a = 8'b11110000; // 240 in decimal
        b = 8'b00001111; // 15 in decimal
        cin = 1;
        #10; // Wait for 10 time units

        // Test Case 3
        a = 8'b10101010; // 170 in decimal
        b = 8'b01010101; // 85 in decimal
        cin = 0;
        #10; // Wait for 10 time units

        // Test Case 4
        a = 8'b11111111; // 255 in decimal
        b = 8'b00000001; // 1 in decimal
        cin = 0;
        #10; // Wait for 10 time units

        // Test Case 5
        a = 8'b00000000; // 0 in decimal
        b = 8'b00000000; // 0 in decimal
        cin = 0;
        #10; // Wait for 10 time units

        // Test Case 6
        a = 8'b11111111; // 255 in decimal
        b = 8'b11111111; // 255 in decimal
        cin = 1;
        #10; // Wait for 10 time units

        // Finish simulation
        $finish;
    end

    // Monitor changes in the outputs
    initial begin
        $monitor("Time = %0t | a = %b | b = %b | cin = %b | sum = %b | cout = %b", 
                 $time, a, b, cin, sum, cout);
    end

endmodule

// module B230519CS_RICHIE_1_tb;
// 	reg [7:0]a,b;
// 	reg cin;
// 	wire [8:0]out;
// 	wire carry;
// 	B230519CS_RICHIE_1 a1(a,b,cin,out,carry);
	
// 	integer i,j;
// 	initial begin
// 	$monitor("a=%b,b=%b,out=%b,carry=%b\n",a,b,out,carry);
// 	for(i=0;i<256;i=i+1)
// 		begin
// 		for(j=0;j<256;j=j+1)
// 			begin
// 			a=i;b=j;cin=1'b0;
// 			#10;
// 			end
// 		end
// 	end
// 	endmodule



