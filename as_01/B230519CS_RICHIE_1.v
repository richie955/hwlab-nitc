module B230519CS_RICHIE_1(input coin_5,input coin_10,output reg change,output reg dispensed,input clk,input reset);

parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
reg [1:0]current,next;

always @(posedge clk,negedge clk)
begin 
if(!reset)
current<=s0;
else
current<=next;
end

always(current,in)begin

	case(current)
	
		s0:
		
		if(coin_5)begin
		next=s1;
		dispensed=0;
		change=0;
		end
		
		if(coin_10)begin
		next=s2;
		dispensed=0;
		change=0;
		end
		
		s1:
		
		if(coin_5)begin
		next=s2;
		dispensed=0;
		change=0;
		end
		
		if(coin_10)	 
		begin
		next=s0;
		dispensed=1;
		change=0;
		end
		
		s2:

		if(coin_5) 
		begin
		next=s0;
		dispensed=1;
		change=0;
		end
		
		if(coin_10)
		begin
		next=s0;
		dispensed=1;
		change=1;
		end
	endcase
	
end
endmodule
		


