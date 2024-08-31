module B230519CS_RICHIE_2TB;

    // Testbench signals
    reg coin_5;
    reg coin_10;
    reg clk;
    reg reset;
    wire change;
    wire dispensed;
	 wire[2:0] current,next;

    // Instantiate the FSM module
    B230519CS_RICHIE_2 INST (
        .coin_5(coin_5),
        .coin_10(coin_10),
        .change(change),
        .dispensed(dispensed),
        .clk(clk),
        .reset(reset),
		  .current(current),
		  .next(next)
    );

    always #5 clk = ~clk; 

    initial begin
        clk = 0;
        reset = 0;
        coin_5 = 0;
        coin_10 = 0;

        // Apply reset
        #5 reset = 1;
        
        #10 coin_5 = 1;
        #10 coin_5 = 0;
        #10 coin_10 = 1;
        #10 coin_10 = 0;

        // Test case 2: Insert two 5 rupee coins
        #20 coin_5 = 1;
        #10 coin_5 = 0;
        #10 coin_5 = 1;
        #10 coin_5 = 0;
			#10 coin_5 = 1;
        #10 coin_5 = 0;

		  
        // Test case 3: Insert a 10 rupee coin, then another 10 rupee coin
        #20 coin_10 = 1;
        #10 coin_10 = 0;
        #10 coin_10 = 1;
        #10 coin_10 = 0;

        // Test case 4: Insert a 5 rupee coin, then another 5 rupee coin, and a 10 rupee coin
        #20 coin_5 = 1;
        #10 coin_5 = 0;
        #10 coin_5 = 1;
        #10 coin_5 = 0;
        #10 coin_10 = 1;
        #10 coin_10 = 0;

        // Finish the simulation
        #20 $finish;
    end

    

endmodule
