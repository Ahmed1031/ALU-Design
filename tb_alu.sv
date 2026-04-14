`timescale 1ns / 1ps

module tb_alu;
  // add package file // 
  import alu_test_pkg::*; 
  
  //clock and reset signal declaration
  bit clk;
  bit reset;

  // Clock generation: 10ns period = 100MHz
  always #5 clk = ~clk;
  
  //creatinng instance of interface, inorder to connect DUT and testcase
  intf_alu tb_intf(clk,reset);

  // Instantiate DUT
  alu dut (
    .clk,
    .reset,
    .a(tb_intf.a),
    .b(tb_intf.b),
	.no_bits(tb_intf.no_bits),
    .valid(tb_intf.valid),
    .add_i(tb_intf.add_i),
	.mul_i(tb_intf.mul_i),
	.sub_i(tb_intf.sub_i),
	.div_i(tb_intf.div_i),
	.or_i(tb_intf.or_i),
	.and_i(tb_intf.and_i),
	.xor_i(tb_intf.xor_i),
	.shf_L_a(tb_intf.shf_L_a),
	.shf_L_b(tb_intf.shf_L_b),
	.c(tb_intf.c)
  );
  ////////////////
  // Tasks //
	  task initialization_state();
		$display("Time=%t, -->> Starting ALU Testbench <<--",$time);
		clk = 0;
		reset = 1;
		tb_intf.a = 4'b0000;
		tb_intf.b = 4'b0000;
		tb_intf.no_bits = 4'b0000;
		tb_intf.valid = 0;
		tb_intf.add_i = 0;
		tb_intf.mul_i = 0;
		tb_intf.sub_i = 0;
		tb_intf.div_i = 0;
		tb_intf.and_i = 0;
		tb_intf.or_i  = 0;
		tb_intf.xor_i = 0;
		tb_intf.shf_L_a = 0;
		tb_intf.shf_L_b = 0;
	 endtask	
	 //////////////////
  
  ///////////////
  arthematic_ops alu_math_functions;
  logical_ops alu_logic_functions;
  // Test sequence
  initial begin
    alu_math_functions = new(tb_intf);
	alu_logic_functions = new(tb_intf);
	initialization_state();
    wait(!tb_intf.reset);
	alu_math_functions.add_op();
	#50;
	alu_math_functions.sub_op();
	#50;
	alu_math_functions.mul_op();
	#20;
	alu_math_functions.div_op();
	#20;
	alu_logic_functions.and_op();
	#20;
	alu_logic_functions.or_op();
	#20;
	alu_logic_functions.xor_op();
	#20;
	alu_logic_functions.shft_left_a_op();
	#20;
	alu_logic_functions.shft_left_b_op();
	#200;
    $display("-- Testing ALU complete --");
    $finish;
  end
  
  // Reset //
  //reset Generation
  initial begin
     reset = 1;
	 $display("Time=%t, << Reseting ALU >>",$time);
    #5 reset =0;
  end

endmodule
