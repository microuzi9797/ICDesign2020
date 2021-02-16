`timescale 1ns/1ps
`define SIZE 10000
module tb_sorting();

	wire [5:0] i0, i1, i2, i3, i4;
	wire [5:0] rank0, rank1, rank2, rank3, rank4;

	reg  [5:0] i0mem[0:`SIZE-1];
	reg  [5:0] i1mem[0:`SIZE-1];
	reg  [5:0] i2mem[0:`SIZE-1];
	reg  [5:0] i3mem[0:`SIZE-1];
	reg  [5:0] i4mem[0:`SIZE-1];

	reg  [5:0] rank0mem[0:`SIZE-1];
	reg  [5:0] rank1mem[0:`SIZE-1];
	reg  [5:0] rank2mem[0:`SIZE-1];
	reg  [5:0] rank3mem[0:`SIZE-1];
	reg  [5:0] rank4mem[0:`SIZE-1];
	wire  [5:0] ans0;
	wire  [5:0] ans1;
	wire  [5:0] ans2;
	wire  [5:0] ans3;
	wire  [5:0] ans4;


	integer i,j,error,error_total,error_part,hide;
	integer err3,err4, err5,err6, err7,err10,err20;
	real time_avg,time_step_sum,time_step,acc,total;




	sorting top(						.rank0(rank0),
										.rank1(rank1),
										.rank2(rank2),
										.rank3(rank3),
										.rank4(rank4),
										.i0(i0),
										.i1(i1),
										.i2(i2),
										.i3(i3),
										.i4(i4)
										);


	initial	begin
		$readmemh("i0.dat", i0mem);
		$readmemh("i1.dat", i1mem);
		$readmemh("i2.dat", i2mem);
		$readmemh("i3.dat", i3mem);
		$readmemh("i4.dat", i4mem);
		$readmemh("golden0.dat",rank0mem);
		$readmemh("golden1.dat",rank1mem);
		$readmemh("golden2.dat",rank2mem);
		$readmemh("golden3.dat",rank3mem);
		$readmemh("golden4.dat",rank4mem);


	end
	initial begin
		$fsdbDumpfile("sorting.fsdb");
		$fsdbDumpvars;
		$fsdbDumpMDA;
	end

	initial
	begin
		i = 0;
		err3 = 0;
		err4 = 0;
		err5 = 0;
		err6 = 0;
		err7 = 0;
		err10 = 0;
		err20 = 0;
	end

	assign i0  = i0mem[i];
	assign i1  = i1mem[i];
	assign i2  = i2mem[i];
	assign i3  = i3mem[i];
	assign i4  = i4mem[i];

	assign ans0 = rank0mem[i];
	assign ans1 = rank1mem[i];
	assign ans2 = rank2mem[i];
	assign ans3 = rank3mem[i];
	assign ans4 = rank4mem[i];

	always begin
		#3
		if(ans0!==rank0||ans1!==rank1||ans2!==rank2||ans3!==rank3||ans4!==rank4)
			err3 = err3 + 1;
		#1
		if(ans0!==rank0||ans1!==rank1||ans2!==rank2||ans3!==rank3||ans4!==rank4)
			err4 = err4 + 1;
		#1
		if(ans0!==rank0||ans1!==rank1||ans2!==rank2||ans3!==rank3||ans4!==rank4)
			err5 = err5 + 1;
		#1
		if(ans0!==rank0||ans1!==rank1||ans2!==rank2||ans3!==rank3||ans4!==rank4)
			err6 = err6 + 1;
		#1
		if(ans0!==rank0||ans1!==rank1&&ans2!==rank2&&ans3!==rank3&&ans4!==rank4)
			err7 = err7 + 1;
		#1
		if(ans0!==rank0||ans1!==rank1||ans2!==rank2||ans3!==rank3||ans4!==rank4)
			err10 = err10 + 1;
		#12
		if(ans0!==rank0||ans1!==rank1||ans2!==rank2||ans3!==rank3||ans4!==rank4)
			err20 = err20 + 1;
		#1
		i = i + 1;
	end

	always @(i) begin
		if(i == 10000) begin
			if(err3 == 0)
				$display("\033[1;32mCongratulations! Your critical path is below 3!\033[m\n");
			else if(err4 == 0)
				$display("\033[1;32mCongratulations! Your critical path is below 4!\033[m\n");
			else if(err5 == 0)
				$display("\033[1;32mCongratulations! Your critical path is below 5!\033[m\n");
			else if(err6 == 0)
				$display("\033[1;32mCongratulations! Your critical path is below 6!\033[m\n");
			else if(err7 == 0)
				$display("\033[1;32mCongratulations! Your critical path is below 7!\033[m\n");
			else if(err10 == 0)
				$display("\033[1;32mCongratulations! Your critical path is below 8!\033[m\n");
			else if(err20 == 0)
				$display("\033[1;32mCongratulations! Your score is 40!\033[m\n");
			else begin
			   $display("There are %d errors.\n", err20);
			   $display("Your score is %g.\n", 40-err20/25);
			end

			$finish;
		end
		if (err20>100)begin
			$display("There is some bug in your code. Errors exceed 100.\n");
			$finish;
		end
	end

endmodule





