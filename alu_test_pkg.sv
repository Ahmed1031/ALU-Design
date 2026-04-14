// SV Package file //
// Package to include tasks for logical and arthematic operations //
////////////////////////////////////////////////////////////////////
// Author : Ahmed Asim Ghouri
// dated : 14/04/2026
/////////////////////////////
// file name : alu_test_pkg.sv
    package alu_test_pkg;
	////////////////////
	
	
      class logical_ops;
	  //creating virtual interface handle
      virtual intf_alu vif;
	  //
	  function new(virtual intf_alu vif);
        this.vif = vif;
      endfunction
      /////////////////
      task and_op();
		$display("Time = %t, << AND op of ALU >>",$time);
		vif.valid = 1;
		vif.and_i = 1;
		vif.a = 4'd7; // Example data
		vif.b = 4'd2; // Example data
		#15;
		$display("-- Bitwise AND : %b and %b = %b --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.and_i = 0;
	 endtask	
	 ////////////////
	 task or_op();
		$display("Time = %t, << OR op of ALU >>",$time);
		vif.valid = 1;
		vif.or_i = 1;
		vif.a = 4'd10; // Example data
		vif.b = 4'd7; // Example data
		#15;
		$display("-- Bitwise OR : %b OR %b = %b --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.or_i = 0;
	 endtask	
	 ////////////////
	 task xor_op();
		$display("Time = %t, << XOR op of ALU >>",$time);
		vif.valid = 1;
		vif.xor_i = 1;
		vif.a = 4'd12; // Example data
		vif.b = 4'd11; // Example data
		#15;
		$display("-- Bitwise XOR : %b XOR %b = %b --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.xor_i = 0;
	 endtask	
	 ///////////////////
	 task shft_left_a_op();
	   $display("Time = %t, << Shift left of a >>",$time);
	   vif.valid = 1;
	   vif.no_bits = 4'd2;
	   vif.shf_L_a = 1;
	   vif.a = 4'd2; // Example data
	   #15;
	   $display("-- Shifting %d bits Left of %b = %b --",vif.no_bits,vif.a,vif.c);
	   vif.valid = 0;
	   vif.shf_L_a = 0;
	 endtask	
	 //////////////////
	 task shft_left_b_op();
	   $display("Time = %t, << Shift left of b >>",$time);
	   vif.valid = 1;
	   vif.no_bits = 4'd3;
	   vif.shf_L_b = 1;
	   vif.b = 4'd5; // Example data
	   #15;
	   $display("-- Shifting %d bits Left of %b = %b --",vif.no_bits,vif.b,vif.c);
	   vif.valid = 0;
	   vif.shf_L_b = 0;
	 endtask	
  	 
     endclass
	 //////////////////////
	 
      class arthematic_ops;
	  // virtual intf_alu#(.WORD_LENGTH(4)) vif;
	  virtual intf_alu vif;
	  //
	  function new(virtual intf_alu vif);
        this.vif = vif;
      endfunction
	  ////////////////////
	  task add_op();
		$display("Time = %t, << ADD op of ALU >>",$time);
		vif.valid = 1;
		vif.add_i = 1;
		vif.a = 4'd2; // Example data
		vif.b = 4'd3; // Examp5le data
		#15;
		$display("-- Adding : %d + %d = %d --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.add_i = 0;
      endtask	
	 //////////////////
	 task sub_op();
		$display("Time = %t, << SUB op of ALU >>",$time);
		vif.valid = 1;
		vif.sub_i = 1;
		vif.a = 4'd4; // Example data
		vif.b = 4'd3; // Example data
		#15;
		$display("-- Subtracting : %d - %d = %d --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.sub_i = 0;
	 endtask	
	 //////////////////
	 task div_op();
		$display("Time = %t, << DIV op of ALU >>",$time);
		vif.valid = 1;
		vif.div_i = 1;
		vif.a = 4'd12; // Example data
		vif.b = 4'd4; // Example data
		#15;
		$display("-- dividing : %d / %d = %d --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.div_i = 0;
	 endtask	
	 //////////////////
	 task mul_op();
		$display("Time = %t, << MUL op of ALU >>",$time);
		vif.valid = 1;
		vif.mul_i = 1;
		vif.a = 4'd3; // Example data
		vif.b = 4'd5; // Example data
		#15;
		$display("-- Multiplying : %d * %d = %d --",vif.a, vif.b, vif.c);
		vif.valid = 0;
		vif.mul_i = 0;
	 endtask	
	 ////////////////
        
      endclass

    endpackage
