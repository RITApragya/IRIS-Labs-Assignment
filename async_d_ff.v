module d_ff_async(input clock,
input reset,
 			input d,
 			output reg q);

always @ (posedge clock or negedge reset) // rising edge of clock is a 1 and falling edge of the reset makes the output 0
	if (reset == 0)
		q <= 0;
	else 
		q <= d;
endmodule

module tb_d_ff;
	
	reg clock;
	reg reset;
	reg d;
	wire q;
	
	D_ff_inst inst (                 // instance
		.clck(clck),
		.res(res),
		.d(d),
		.q(q)
	);

	initial begin
		clck = 0;
		res = 1;
		d = 0;

	#5 reset = 0;
	#5 reset = 1;
	#5 d = 1;
	#5 d = 0;
	#5 d = 1;

	#20 $finish;
	end
	
	
	always begin 
		#5 clck = ~clck;
	end
