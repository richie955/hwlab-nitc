module B230519CS_RICHIE_2(input coin_5,input coin_10,output reg change,output reg dispensed,output reg[2:0] current,next,input clk,input reset);

parameter s0 = 3'b000,
          s1 = 3'b001,
          s2 = 3'b010,
          s3 = 3'b011,
          s4 = 3'b100;


always @(posedge clk,negedge reset)

begin 

if(!reset) current<=s0;
else current<=next;

end

always @(current,coin_5,coin_10)
begin

	next = current;

	case(current)
	
		s0: begin
		
		if(coin_5)
		begin
		next=s1;
		end
		if(coin_10)
		begin
		next=s2;
		end
		
		end
		
		
		s1: begin
		
		if(coin_5)
		begin
		next=s2;
		end
		
		if(coin_10)	 
		begin
		next=s3;
		end
		
		end
		
		s2: begin
		
		if(coin_5)
		next=s3;
	
		if(coin_10)	 
		next=s4;
	
		end
		

		s3: begin
		next=s0;
		end
		
		s4: begin
		next=s0;
		end
		
	endcase
	
	end
	
always @(current) begin



    case (current)
    
        s3: 
		  begin
            dispensed = 1'b1;    // Updated from detected to dispensed
            change = 1'b0;
        end
        
        s4: 
		  begin
            change = 1'b1;
            dispensed = 1'b1;    // Updated from detected to dispensed
        end
        
        default:
		  begin
            dispensed = 1'b0;    // Updated from detected to dispensed
            change = 1'b0;
        end
        
    endcase
end

endmodule


		


