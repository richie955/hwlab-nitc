
module main_tb;
reg in, 
reset, 
clk;
wire out;

B230519CS_RICHIE_1 INST( in, clk, reset,out);

initial 

begin
in = 0;
reset = 0;
clk = 0;	

#20
reset=1;
end

always #20 {in} = $random; //initially input stream change was set to double the frequency of clk, so spikes and different duration outputs were obtained.
always #10 clk = ~clk;  //now i used same frequency and it works.
endmodule