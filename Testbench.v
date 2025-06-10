`include "Adderfsm.v"
`timescale 1ns/1ns

module test;

	reg clk,a,b,rst;
	wire stream;
	
	adder dut
	(
		.clk(clk),
		.rst(rst),
		.a(a),
        .b(b),
        .stream(stream)
	);
	
	initial
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
	
	initial
	begin
		rst = 0;
		a = 1'b0; b = 1'b0;

		// #10 rst = 0;
        // #10 a = 0; b= 0;
		// #10 a = 0; b= 1;
		// #10 a = 1; b= 1;
		// #10 a = 1; b= 1;
		// #10 a = 0; b= 1;
		// #10 a = 1; b= 0;
		// #10 a = 0; b= 0;

		repeat(100) begin
			#10
			a = $random % 2;
			b = $random % 2;
		end
		
	end

initial begin
  $monitor($time, " a = %0b , b = %0b , stream = %0b" , a,b,stream);
end
	
initial begin
	$dumpfile("fsm.vcd");
	$dumpvars(0,test);

	#2000 $finish;
end
endmodule
	
