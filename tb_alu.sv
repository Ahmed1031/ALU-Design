`timescale 1ns / 1ps

module tb_alu;

  // Parameters
  parameter WORD_LENGTH = 4;

  // DUT Signals
  logic clk;
  logic tb_rst;
  logic [WORD_LENGTH-1:0] tb_a;
  logic [WORD_LENGTH-1:0] tb_b;
  logic tb_valid;
  logic tb_add;
  logic tb_mul;
  logic tb_sub;
  logic tb_div;
  logic [WORD_LENGTH*2-1:0] tb_c;

  // Clock generation: 10ns period = 100MHz
  always #5 clk = ~clk;

  // Instantiate DUT
  alu #(
    .WORD_LENGTH(WORD_LENGTH)
  ) dut (
    .clk(clk),
    .reset(tb_rst),
    .a(tb_a),
    .b(tb_b),
    .valid(tb_valid),
    .add_i(tb_add),
	.mul_i(tb_mul),
	.sub_i(tb_sub),
	.div_i(tb_div),
	.c(tb_c)
  );
  
   // Test sequence
  initial begin
    $display("Time=%t, -->> Starting ALU Testbench <<--",$time);
    clk = 0;
    tb_rst = 1;
    tb_valid = 0;
    tb_add = 0;
	tb_mul = 0;
	tb_sub = 0;
	tb_div = 0;
	

    // ALU ADD OP
    wait(!tb_rst);
    $display("Time = %t, << out of Reset ALU >>",$time);
    #50;
	$display("Time = %t, << ADD op of ALU >>",$time);
    tb_valid = 1;
	tb_add = 1;
	tb_a = 4'd2; // Example data
	tb_b = 4'd3; // Example data
    #10;
    tb_valid = 0;
	tb_add = 0;
	#50;
	// ALU SUB OP
	$display("Time = %t, << SUB op of ALU >>",$time);
    tb_valid = 1;
	tb_sub = 1;
	tb_a = 4'd4; // Example data
	tb_b = 4'd3; // Example data
    #10;
    tb_valid = 0;
	tb_sub = 0;
	#50;
	// ALU MUL OP
	$display("Time = %t, << MUL op of ALU >>",$time);
    tb_valid = 1;
	tb_mul = 1;
	tb_a = 4'd3; // Example data
	tb_b = 4'd5; // Example data
    #10;
    tb_valid = 0;
	tb_mul = 0;
	#20;
	// ALU DIV OP
	$display("Time = %t, << DIV op of ALU >>",$time);
    tb_valid = 1;
	tb_div = 1;
	tb_a = 4'd12; // Example data
	tb_b = 4'd4; // Example data
    #10;
    tb_valid = 0;
	tb_div = 0;
	#200;
    $display("-- Testing ALU complete --");
    $finish;
  end
  
  // Reset //
  //reset Generation
  initial begin
    tb_rst = 1;
	 $display("Time=%t, << Reseting ALU >>",$time);
    #5 tb_rst =0;
  end

endmodule