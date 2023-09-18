// performs a pipelined matrix multiply that splits columnwise

module matrixMult #(
		parameter SIZE = 3,
		parameter IN_BITS = 8,
		parameter IN_FRAC_BITS = 2
	)
	(
		input 	clk,
		input 	rst,
		input		[SIZE-1:0][SIZE-1:0][IN_BITS-1:0] a,
		input 	[SIZE-1:0][SIZE-1:0][IN_BITS-1:0] b,
		output 	[SIZE-1:0][SIZE-1:0][IN_BITS-1:0] out
	);
	
	// buffers
	logic [SIZE-1:0][SIZE-1:0][IN_BITS-1:0] buffA 		[SIZE];	//registers
	logic [SIZE-1:0][SIZE-1:0][IN_BITS-1:0] buffB 		[SIZE];	//registers
	logic [SIZE-1:0][SIZE-1:0][IN_BITS-1:0] buffC 		[SIZE];	//registers
	logic [SIZE-1:0][SIZE-1:0][IN_BITS-1:0] buffC_d 	[SIZE];	//wires
	
	assign out = buffC[SIZE-1];
	
	// sequential logic
	always_ff @ (posedge clk) begin
		if (rst) begin
			for(int i = 0; i < SIZE; i++) begin
				buffA[i] <= 'b0;
				buffB[i] <= 'b0;
				buffC[i] <= 'b0;
			end
		end else begin
			buffA[0] <= a;
			buffB[0] <= b;
			
			for (int i = 1; i < SIZE; i++) begin
				buffA[i] <= buffA[i-1];
				buffB[i] <= buffB[i-1];
			end
			
			buffC[0] <= buffC_d[0];
			for (int i = 1; i < SIZE; i++) begin
				for (int j = 0; j < SIZE; j++) begin
					buffC[i][j] <= buffC[i-1][j] | (buffC_d[i][j][i] << (i*IN_BITS));
				end
			end
		end
	end
	
	genvar col;
	generate	
		for(col = 0; col < SIZE; col++) begin : multCols
			always_comb begin
				buffC_d[col] = 'b0;
				for(int i = 0; i < SIZE; i = i + 1) begin
					buffC_d[col][i][col] = 'b0;
					for(int r = 0; r < SIZE; r = r + 1) begin
						buffC_d[col][i][col] += buffA[col][i][r] * buffB[col][r][col]; 
					end			
				end
			end
		end
	endgenerate
endmodule