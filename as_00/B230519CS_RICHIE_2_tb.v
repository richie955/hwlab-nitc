module B230519CS_RICHIE_2_tb;

  reg [7:0] a, b;
  reg bin;
  wire [7:0] diff;
  wire bout;

   B230519CS_RICHIE_2 t(a,b,bin,diff,bout);
  initial begin
    

    // Test case 1: 5 - 3
    a = 8'b00000101; // 5
    b = 8'b00000011; // 3
    bin = 1'b0;      // No initial borrow
    #10;             // Wait for 10 time units
    $display("%b %b %b  |  %b  %b", a, b, bin, diff, bout);

    // Test case 2: 10 - 5
    a = 8'b00001010; // 10
    b = 8'b00000101; // 5
    bin = 1'b0;      // No initial borrow
    #10;             // Wait for 10 time units
    $display("%b %b %b  |  %b  %b", a, b, bin, diff, bout);

    // Test case 3: 15 - 10
    a = 8'b00001111; // 15
    b = 8'b00001010; // 10
    bin = 1'b0;      // No initial borrow
    #10;             // Wait for 10 time units
    $display("%b %b %b  |  %b  %b", a, b, bin, diff, bout);

    // Test case 4: 8 - 12 (This will test a borrow-out case)
    a = 8'b00001000; // 8
    b = 8'b00001100; // 12
    bin = 1'b0;      // No initial borrow
    #10;             // Wait for 10 time units
    $display("%b %b %b  |  %b  %b", a, b, bin, diff, bout);

    // Test case 5: 0 - 0
    a = 8'b00000000; // 0
    b = 8'b00000000; // 0
    bin = 1'b0;      // No initial borrow
    #10;             // Wait for 10 time units
    $display("%b %b %b  |  %b  %b", a, b, bin, diff, bout);

    // Test case 6: 255 - 255 (Test case with maximum values)
    a = 8'b11111111; // 255
    b = 8'b11111111; // 255
    bin = 1'b0;      // No initial borrow
    #10;             // Wait for 10 time units
    $display("%b %b %b  |  %b  %b", a, b, bin, diff, bout);

    // End of simulation
    $finish;
  end
endmodule



