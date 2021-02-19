module sqrt (
	input clk,
	input rst_n,
	input [9:0] i_radicand,
	output o_finish,
	output [4:0] o_root,
	output [50:0] number
);
	wire [4:0] tryQ;
	wire [4:0] root;
	wire [9:0] product;
	wire [50:0] num[0:14];
	// try number flip flop
	FD2 fd_try0(tryQ[0], root[0], clk, rst_n, num[0]);
	FD2 fd_try1(tryQ[1], root[1], clk, rst_n, num[1]);
	FD2 fd_try2(tryQ[2], root[2], clk, rst_n, num[2]);
	FD2 fd_try3(tryQ[3], root[3], clk, rst_n, num[3]);
	FD2 fd_try4(tryQ[4], root[4], clk, rst_n, num[4]);
	// root = sub 1 from try number
	subtracter_1 sub_1(.A(tryQ), .Z(root), .number(num[5]));
	FD2 fd_root0(o_root[0], root[0], clk, rst_n, num[6]);
	FD2 fd_root1(o_root[1], root[1], clk, rst_n, num[7]);
	FD2 fd_root2(o_root[2], root[2], clk, rst_n, num[8]);
	FD2 fd_root3(o_root[3], root[3], clk, rst_n, num[9]);
	FD2 fd_root4(o_root[4], root[4], clk, rst_n, num[10]);
	// try the root
	multiplier mul(.X(root), .Y(root), .P(product), .number(num[11]));
	comparator com(.A(product), .B(i_radicand), .LE(Flag), .number(num[12]));
	// finish
	MUX21H mux(finish, 1'b0, 1'b1, Flag, num[13]);
	FD2 fd_finish(o_finish, finish, clk, rst_n, num[14]);
	// sum number of transistors
	reg [50:0] sum;
	integer i;
	always @(*) begin
		sum = 0;
		for (i = 0; i < 15; i = i + 1) begin
			sum = sum + num[i];
		end
	end
	// transistor number
	assign number = sum;
endmodule

module subtracter_1 (
	input [4:0] A,
	output [4:0] Z,
	output [50:0] number
);
	wire [50:0] num[0:4];
	HA1 ha0(carry0, Z[0], A[0], 1'b1, num[0]);
	FA1 fa1(carry1, Z[1], A[1], 1'b1, carry0, num[1]);
	FA1 fa2(carry2, Z[2], A[2], 1'b1, carry1, num[2]);
	FA1 fa3(carry3, Z[3], A[3], 1'b1, carry2, num[3]);
	FA1 fa4(carry4, Z[4], A[4], 1'b1, carry3, num[4]);
	// sum number of transistors
	reg [50:0] sum;
	integer i;
	always @(*) begin
		sum = 0;
		for (i = 0; i < 5; i = i + 1) begin
			sum = sum + num[i];
		end
	end
	// transistor number
	assign number = sum;
endmodule

module multiplier (
	input [4:0] X,
	input [4:0] Y,
	output [9:0] P,
	output [50:0] number
);
	wire [50:0] num[0:5][0:4];
	// CSA Array
	CSA x0_y0(.A(X[0]), .B(Y[0]), .Sin(1'b0), .Cin(1'b0), .Sout(P[0]), .Cout(carry00), .number(num[0][0]));
	CSA x0_y1(.A(X[0]), .B(Y[1]), .Sin(1'b0), .Cin(1'b0), .Sout(s_01), .Cout(carry01), .number(num[0][1]));
	CSA x0_y2(.A(X[0]), .B(Y[2]), .Sin(1'b0), .Cin(1'b0), .Sout(s_02), .Cout(carry02), .number(num[0][2]));
	CSA x0_y3(.A(X[0]), .B(Y[3]), .Sin(1'b0), .Cin(1'b0), .Sout(s_03), .Cout(carry03), .number(num[0][3]));
	CSA x0_y4(.A(X[0]), .B(Y[4]), .Sin(1'b0), .Cin(1'b0), .Sout(s_04), .Cout(carry04), .number(num[0][4]));

	CSA x1_y0(.A(X[1]), .B(Y[0]), .Sin(s_01), .Cin(carry00), .Sout(P[1]), .Cout(carry10), .number(num[1][0]));
	CSA x1_y1(.A(X[1]), .B(Y[1]), .Sin(s_02), .Cin(carry01), .Sout(s_11), .Cout(carry11), .number(num[1][1]));
	CSA x1_y2(.A(X[1]), .B(Y[2]), .Sin(s_03), .Cin(carry02), .Sout(s_12), .Cout(carry12), .number(num[1][2]));
	CSA x1_y3(.A(X[1]), .B(Y[3]), .Sin(s_04), .Cin(carry03), .Sout(s_13), .Cout(carry13), .number(num[1][3]));
	CSA x1_y4(.A(X[1]), .B(Y[4]), .Sin(1'b0), .Cin(carry04), .Sout(s_14), .Cout(carry14), .number(num[1][4]));

	CSA x2_y0(.A(X[2]), .B(Y[0]), .Sin(s_11), .Cin(carry10), .Sout(P[2]), .Cout(carry20), .number(num[2][0]));
	CSA x2_y1(.A(X[2]), .B(Y[1]), .Sin(s_12), .Cin(carry11), .Sout(s_21), .Cout(carry21), .number(num[2][1]));
	CSA x2_y2(.A(X[2]), .B(Y[2]), .Sin(s_13), .Cin(carry12), .Sout(s_22), .Cout(carry22), .number(num[2][2]));
	CSA x2_y3(.A(X[2]), .B(Y[3]), .Sin(s_14), .Cin(carry13), .Sout(s_23), .Cout(carry23), .number(num[2][3]));
	CSA x2_y4(.A(X[2]), .B(Y[4]), .Sin(1'b0), .Cin(carry14), .Sout(s_24), .Cout(carry24), .number(num[2][4]));

	CSA x3_y0(.A(X[3]), .B(Y[0]), .Sin(s_21), .Cin(carry20), .Sout(P[3]), .Cout(carry30), .number(num[3][0]));
	CSA x3_y1(.A(X[3]), .B(Y[1]), .Sin(s_22), .Cin(carry21), .Sout(s_31), .Cout(carry31), .number(num[3][1]));
	CSA x3_y2(.A(X[3]), .B(Y[2]), .Sin(s_23), .Cin(carry22), .Sout(s_32), .Cout(carry32), .number(num[3][2]));
	CSA x3_y3(.A(X[3]), .B(Y[3]), .Sin(s_24), .Cin(carry23), .Sout(s_33), .Cout(carry33), .number(num[3][3]));
	CSA x3_y4(.A(X[3]), .B(Y[4]), .Sin(1'b0), .Cin(carry24), .Sout(s_34), .Cout(carry34), .number(num[3][4]));

	CSA x4_y0(.A(X[4]), .B(Y[0]), .Sin(s_31), .Cin(carry30), .Sout(P[4]), .Cout(carry40), .number(num[4][0]));
	CSA x4_y1(.A(X[4]), .B(Y[1]), .Sin(s_32), .Cin(carry31), .Sout(s_41), .Cout(carry41), .number(num[4][1]));
	CSA x4_y2(.A(X[4]), .B(Y[2]), .Sin(s_33), .Cin(carry32), .Sout(s_42), .Cout(carry42), .number(num[4][2]));
	CSA x4_y3(.A(X[4]), .B(Y[3]), .Sin(s_34), .Cin(carry33), .Sout(s_43), .Cout(carry43), .number(num[4][3]));
	CSA x4_y4(.A(X[4]), .B(Y[4]), .Sin(1'b0), .Cin(carry34), .Sout(s_44), .Cout(carry44), .number(num[4][4]));
	// CPA
	HA1 ha_p5(carry_p5, P[5], s_41, carry40, num[5][0]);
	FA1 fa_p6(carry_p6, P[6], s_42, carry41, carry_p5, num[5][1]);
	FA1 fa_p7(carry_p7, P[7], s_43, carry42, carry_p6, num[5][2]);
	FA1 fa_p8(carry_p8, P[8], s_44, carry43, carry_p7, num[5][3]);
	HA1 ha_p9(carry_p9, P[9], carry44, carry_p8, num[5][4]);
	// sum number of transistors
	reg [50:0] sum;
	integer i, j;
	always @(*) begin
		sum = 0;
		for (i = 0; i < 6; i = i + 1) begin
			for (j = 0; j < 5; j = j + 1) begin
				sum = sum + num[i][j];
			end
		end
	end
	// transistor number
	assign number = sum;
endmodule

module CSA (
	input A,
	input B,
	input Sin,
	input Cin,
	output Sout,
	output Cout,
	output [50:0] number
);
	wire [50:0] num_an, num_fa;
	AN2 an(and_a_b, A, B, num_an);
	FA1 fa(Cout, Sout, and_a_b, Sin, Cin, num_fa);
	assign number = num_an + num_fa;
endmodule

module comparator (
	input [9:0] A,
	input [9:0] B,
	output LE,
	output [50:0] number
);
	wire [50:0] num[0:54];
	// A[9] is smaller than B[9]
	IV iv9(inv_a9, A[9], num[0]);
	AN2 an9(W9, inv_a9, B[9], num[1]);
	// A[9] == B[9] and A[8] is smaller than B[8]
	EO eo9(E9, A[9], B[9], num[2]);
	IV iv8(inv_a8, A[8], num[3]);
	ND2 nd8(L8, inv_a8, B[8], num[4]);
	NR2 nr8(W8, E9, L8, num[5]);
	// A[9] == B[9], A[8] == B[8] and A[7] is smaller than B[7]
	EO eo8(E8, A[8], B[8], num[6]);
	IV iv7(inv_a7, A[7], num[7]);
	ND2 nd7(L7, inv_a7, B[7], num[8]);
	NR3 nr7(W7, E9, E8, L7, num[9]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7] and A[6] is smaller than B[6]
	EO eo7(E7, A[7], B[7], num[10]);
	IV iv6(inv_a6, A[6], num[11]);
	ND2 nd6(L6, inv_a6, B[6], num[12]);
	NR4 nr6(W6, E9, E8, E7, L6, num[13]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7], A[6] == B[6] and A[5] is smaller than B[5]
	EO eo6(E6, A[6], B[6], num[14]);
	IV iv5(inv_a5, A[5], num[15]);
	ND2 nd5(L5, inv_a5, B[5], num[16]);
	NR3 nr_t1(T1, E9, E8, E7, num[17]);
	NR2 nr_t2(T2, E6, L5, num[18]);
	AN2 an_w5(W5, T1, T2, num[19]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7], A[6] == B[6], A[5] == B[5] and A[4] is smaller than B[4]
	EO eo5(E5, A[5], B[5], num[20]);
	IV iv4(inv_a4, A[4], num[21]);
	ND2 nd4(L4, inv_a4, B[4], num[22]);
	NR3 nr4(T3, E6, E5, L4, num[23]);
	AN2 an_w4(W4, T1, T3, num[24]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7], A[6] == B[6], A[5] == B[5], A[4] == B[4] and A[3] is smaller than B[3]
	EO eo4(E4, A[4], B[4], num[25]);
	IV iv3(inv_a3, A[3], num[26]);
	ND2 nd3(L3, inv_a3, B[3], num[27]);
	NR4 nr3(T4, E6, E5, E4, L3, num[28]);
	AN2 an_w3(W3, T1, T4, num[29]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7], A[6] == B[6], A[5] == B[5], A[4] == B[4], A[3] == B[3] and A[2] is smaller than B[2]
	EO eo3(E3, A[3], B[3], num[30]);
	IV iv2(inv_a2, A[2], num[31]);
	ND2 nd2(L2, inv_a2, B[2], num[32]);
	NR4 nr_t5(T5, E9, E8, E7, E6, num[33]);
	NR4 nr_t6(T6, E5, E4, E3, L2, num[34]);
	AN2 an_w2(W2, T5, T6, num[35]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7], A[6] == B[6], A[5] == B[5], A[4] == B[4], A[3] == B[3], A[2] == B[2] and A[1] is smaller than B[1]
	EO eo2(E2, A[2], B[2], num[36]);
	IV iv1(inv_a1, A[1], num[37]);
	ND2 nd1(L1, inv_a1, B[1], num[38]);
	NR3 nr_t7(T7, E6, E5, E4, num[39]);
	NR3 nr1(T8, E3, E2, L1, num[40]);
	AN3 an_w1(W1, T1, T7, T8, num[41]);
	// A[9] == B[9], A[8] == B[8], A[7] == B[7], A[6] == B[6], A[5] == B[5], A[4] == B[4], A[3] == B[3], A[2] == B[2], A[1] == B[1] and A[0] is smaller than B[0]
	EO eo1(E1, A[1], B[1], num[42]);
	IV iv0(inv_a0, A[0], num[43]);
	ND2 nd0(L0, inv_a0, B[0], num[44]);
	NR4 nr_t9(T9, E5, E4, E3, E2, num[45]);
	NR2 nr0(T10, E1, L0, num[46]);
	AN3 an_w0(W0, T5, T9, T10, num[47]);
	// A == B
	EO eo0(E0, A[0], B[0], num[48]);
	NR2 nr_t11(T11, E1, E0, num[49]);
	AN3 an_w00(W00, T5, T9, T11, num[50]);
	// combine
	NR4 nrall1(ALL1 ,W9, W8, W7, W6, num[51]);
	NR4 nrall2(ALL2 ,W5, W4, W3, W2, num[52]);
	NR3 nrall3(ALL3, W1, W0, W00, num[53]);
	ND3 ndall(LE, ALL1, ALL2, ALL3, num[54]);
	// sum number of transistors
	reg [50:0] sum;
	integer i;
	always @(*) begin
		sum = 0;
		for (i = 0; i < 55; i = i + 1) begin
			sum = sum + num[i];
		end
	end
	// transistor number
	assign number = sum;
endmodule