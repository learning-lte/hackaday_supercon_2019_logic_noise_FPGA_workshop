module oscillator (
	input clk,
	input rst,
	input [17:0] counter_top,
	output out
);

reg [23:0] counter; // 24-bit counter
reg counterout = 0;

always @(posedge clk) begin
	if (rst) 
	begin
		counter <= 0;
		counterout <= 0;
	end else
	begin
		if (counter < counter_top)
		begin
			counter <= counter + 1;
		end else 
		begin
			counter <= 0;
			counterout <= ~counterout;
		end
	end
end

assign out = counterout;

endmodule

