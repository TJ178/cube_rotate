module testMatrixMult();

	localparam IN_BITS = 8;
	localparam SIZE = 3;

	logic [SIZE-1:0][SIZE-1:0][IN_BITS-1:0] a, b, out;
	
	logic clk = 0;
	logic rst = 0;
	
	matrixMult m(.clk(clk), .rst(rst), .a(a), .b(b), .out(out));
	
	initial begin
		a[2] = {8'd1, 8'd2, 8'd3};
		a[1] = {8'd0, 8'd1, 8'd0};
		a[0] = {8'd0, 8'd0, 8'd1};
		
		b[2] = {8'd0, 8'd0, 8'd1};
		b[1] = {8'd0, 8'd1, 8'd0};
		b[0] = {8'd1, 8'd2, 8'd3};
		
		rst = 1;
		#6;
		rst = 0;
		
		#30;
		$display(out);
		$finish;
		
	end
	
	always begin
		clk = ~clk;
		#1;
	end

endmodule