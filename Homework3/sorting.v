`timescale 1ns/1ps

module sorting(rank0, rank1, rank2, rank3, rank4, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [5:0] i0, i1, i2, i3, i4;
	output [5:0] rank0, rank1, rank2, rank3, rank4;
//---------------------------------------------------
	wire [4:0] bool0, bool1, bool2, bool3, bool4;
	wire [4:0] inv_bool0, inv_bool1, inv_bool2, inv_bool3, inv_bool4;
	wire [2:0] index0, index1, index2, index3, index4;
	// comparing results
	comparator c01(.G(com01), .A(i0), .B(i1));
	comparator c02(.G(com02), .A(i0), .B(i2));
	comparator c03(.G(com03), .A(i0), .B(i3));
	comparator c04(.G(com04), .A(i0), .B(i4));
	comparator c12(.G(com12), .A(i1), .B(i2));
	comparator c13(.G(com13), .A(i1), .B(i3));
	comparator c14(.G(com14), .A(i1), .B(i4));
	comparator c23(.G(com23), .A(i2), .B(i3));
	comparator c24(.G(com24), .A(i2), .B(i4));
	comparator c34(.G(com34), .A(i3), .B(i4));
	IV ivcom01(com10, com01);
	IV ivcom02(com20, com02);
	IV ivcom03(com30, com03);
	IV ivcom04(com40, com04);
	IV ivcom12(com21, com12);
	IV ivcom13(com31, com13);
	IV ivcom14(com41, com14);
	IV ivcom23(com32, com23);
	IV ivcom24(com42, com24);
	IV ivcom34(com43, com34);
	// compute how many numbers the i-th number is bigger than (by half adder)
	// i0
	EO eo0_12(s0_12, com01, com02);
	AN2 an0_12(co0_12, com01, com02);
	EO eo0_34(s0_34, com03, com04);
	AN2 an0_34(co0_34, com03, com04);
	// i1
	EO eo1_02(s1_02, com10, com12);
	AN2 an1_02(co1_02, com10, com12);
	EO eo1_34(s1_34, com13, com14);
	AN2 an1_34(co1_34, com13, com14);
	// i2
	EO eo2_01(s2_01, com20, com21);
	NR2 an2_01(co2_01, com02, com12);
	EO eo2_34(s2_34, com23, com24);
	AN2 an2_34(co2_34, com23, com24);
	// i3
	EO eo3_01(s3_01, com30, com31);
	NR2 an3_01(co3_01, com03, com13);
	EO eo3_24(s3_24, com32, com34);
	AN2 an3_24(co3_24, com32, com34);
	// i4
	EO eo4_01(s4_01, com40, com41);
	NR2 an4_01(co4_01, com04, com14);
	EO eo4_23(s4_23, com42, com43);
	NR2 an4_23(co4_23, com24, com34);
	// compute the index and choose the right number
	// choose rank0 : all compare == 1
	AN4 all1_0(bool0[0], com01, com02, com03, com04);
	ND4 all1_1(inv_bool0[1], com10, com12, com13, com14);
	ND4 all1_2(inv_bool0[2], com20, com21, com23, com24);
	ND4 all1_3(inv_bool0[3], com30, com31, com32, com34);
	NR4 all1_4(bool0[4], com04, com14, com24, com34);
	// index and choose
	assign index0[2] = bool0[4];
	ND2 index0_bit1(index0[1], inv_bool0[3], inv_bool0[2]);
	ND2 index0_bit0(index0[0], inv_bool0[3], inv_bool0[1]);
	selector sel0(.Z(rank0), .A(i0), .B(i1), .C(i2), .D(i3), .E(i4), .CTRL(index0));
	// choose rank1 : bigger than 3 numbers (HA results : 10/01 or 01/10)
	// i0
	EO eo1_0_s(s_bool1_0, s0_12, s0_34);
	EO eo1_0_co(co_bool1_0, co0_12, co0_34);
	AN2 an1_0(bool1[0], co_bool1_0, s_bool1_0);
	// i1
	EO eo1_1_s(s_bool1_1, s1_02, s1_34);
	EO eo1_1_co(co_bool1_1, co1_02, co1_34);
	ND2 nd1_1(inv_bool1[1], co_bool1_1, s_bool1_1);
	// i2
	EO eo1_2_s(s_bool1_2, s2_01, s2_34);
	EO eo1_2_co(co_bool1_2, co2_01, co2_34);
	ND2 nd1_2(inv_bool1[2], co_bool1_2, s_bool1_2);
	// i3
	EO eo1_3_s(s_bool1_3, s3_01, s3_24);
	EO en1_3_co(co_bool1_3, co3_01, co3_24);
	ND2 nd1_3(inv_bool1[3], co_bool1_3, s_bool1_3);
	// i4
	EO eo1_4_s(s_bool1_4, s4_01, s4_23);
	EO eo1_4_co(co_bool1_4, co4_01, co4_23);
	AN2 an1_4(bool1[4], co_bool1_4, s_bool1_4);
	// index and choose
	assign index1[2] = bool1[4];
	ND2 index1_bit1(index1[1], inv_bool1[3], inv_bool1[2]);
	ND2 index1_bit0(index1[0], inv_bool1[3], inv_bool1[1]);
	selector sel1(.Z(rank1), .A(i0), .B(i1), .C(i2), .D(i3), .E(i4), .CTRL(index1));
	// choose rank2 : median (HA results : 10/00 or 01/01 or 00/10)
	// i0
	EO eo2_0_co(co2_0, co0_12, co0_34);
	NR2 nr2_0_s(nr_s2_0, s0_12, s0_34);
	ND2 nd2_0_co(one_side0, co2_0, nr_s2_0);
	ND2 nd2_0_s(s2_0, s0_12, s0_34);
	ND2 nd2_0(bool2[0], one_side0, s2_0);
	// i1
	EO eo2_1_co(co2_1, co1_02, co1_34);
	NR2 nr2_1_s(nr_s2_1, s1_02, s1_34);
	ND2 nd2_1_co(one_side1, co2_1, nr_s2_1);
	ND2 nd2_1_s(s2_1, s1_02, s1_34);
	AN2 an2_1(inv_bool2[1], one_side1, s2_1);
	// i2
	EO eo2_2_co(co2_2, co2_01, co2_34);
	NR2 nr2_2_s(nr_s2_2, s2_01, s2_34);
	ND2 nd2_2_co(one_side2, co2_2, nr_s2_2);
	ND2 nd2_2_s(s2_2, s2_01, s2_34);
	AN2 an2_2(inv_bool2[2], one_side2, s2_2);
	// i3
	EO eo2_3_co(co2_3, co3_01, co3_24);
	NR2 nr2_3_s(nr_s2_3, s3_01, s3_24);
	ND2 nd2_3_co(one_side3, co2_3, nr_s2_3);
	ND2 nd2_3_s(s2_3, s3_01, s3_24);
	AN2 an2_3(inv_bool2[3], one_side3, s2_3);
	// i4
	EO eo2_4_co(co2_4, co4_01, co4_23);
	NR2 nr2_4_s(nr_s2_4, s4_01, s4_23);
	ND2 nd2_4_co(one_side4, co2_4, nr_s2_4);
	ND2 nd2_4_s(s2_4, s4_01, s4_23);
	ND2 nd2_4(bool2[4], one_side4, s2_4);
	// index and choose
	assign index2[2] = bool2[4];
	ND2 index2_bit1(index2[1], inv_bool2[3], inv_bool2[2]);
	ND2 index2_bit0(index2[0], inv_bool2[3], inv_bool2[1]);
	selector sel2(.Z(rank2), .A(i0), .B(i1), .C(i2), .D(i3), .E(i4), .CTRL(index2));
	// choose rank3 : bigger than 1 number (HA results : 01/00 or 00/01)
	// i0
	EO eo3_0_s(inv_s_bool3_0, s0_12, s0_34);
	EO eo3_0_co(co_bool3_0, co0_12, co0_34);
	IV iv3_0_s(s_bool3_0, inv_s_bool3_0);
	NR2 an3_0(bool3[0], co_bool3_0, s_bool3_0);
	// i1
	EO eo3_1_s(s_bool3_1, s1_02, s1_34);
	EO eo3_1_co(inv_co_bool3_1, co1_02, co1_34);
	IV iv3_1_co(co_bool3_1, inv_co_bool3_1);
	ND2 nd3_1(inv_bool3[1], co_bool3_1, s_bool3_1);
	// i2
	EO eo3_2_s(s_bool3_2, s2_01, s2_34);
	EO eo3_2(inv_co_bool3_2, co2_01, co2_34);
	IV iv3_2_co(co_bool3_2, inv_co_bool3_2);
	ND2 nd3_2(inv_bool3[2], co_bool3_2, s_bool3_2);
	// i3
	EO eo3_3_s(s_bool3_3, s3_01, s3_24);
	EO eo3_3_co(inv_co_bool3_3, co3_01, co3_24);
	IV iv3_3_co(co_bool3_3, inv_co_bool3_3);
	ND2 nd3_3(inv_bool3[3], co_bool3_3, s_bool3_3);
	// i4
	EO eo3_4_s(inv_s_bool3_4, s4_01, s4_23);
	EO eo3_4_co(co_bool3_4, co4_01, co4_23);
	IV iv3_4_s(s_bool3_4, inv_s_bool3_4);
	NR2 an3_4(bool3[4], co_bool3_4, s_bool3_4);
	// index and choose
	assign index3[2] = bool3[4];
	ND2 index3_bit1(index3[1], inv_bool3[3], inv_bool3[2]);
	ND2 index3_bit0(index3[0], inv_bool3[3], inv_bool3[1]);
	selector sel3(.Z(rank3), .A(i0), .B(i1), .C(i2), .D(i3), .E(i4), .CTRL(index3));
	// choose rank4 : all compare == 0
	NR4 all0_0(bool4[0], com01, com02, com03, com04);
	ND4 all0_1(inv_bool4[1], com01, com21, com31, com41);
	ND4 all0_2(inv_bool4[2], com02, com12, com32, com42);
	ND4 all0_3(inv_bool4[3], com03, com13, com23, com43);
	AN4 all0_4(bool4[4], com04, com14, com24, com34);
	// index and choose
	assign index4[2] = bool4[4];
	ND2 index4_bit1(index4[1], inv_bool4[3], inv_bool4[2]);
	ND2 index4_bit0(index4[0], inv_bool4[3], inv_bool4[1]);
	selector sel4(.Z(rank4), .A(i0), .B(i1), .C(i2), .D(i3), .E(i4), .CTRL(index4));

endmodule

module comparator(G, A, B);
	input [5:0] A, B;
	output G;
	// A[5] is bigger than B[5]
	IV iv5(inv_b5, B[5]);
	AN2 an5(W5, A[5], inv_b5);
	// A[5] == B[5] and A[4] is bigger than B[4]
	EO eo5(E5, A[5], B[5]);
	IV iv4(inv_b4, B[4]);
	ND2 nd4(G4, A[4], inv_b4);
	NR2	nr4(W4, E5, G4);
	// A[5] == B[5], A[4] == B[4] and A[3] is bigger than B[3]
	EO eo4(E4, A[4], B[4]);
	IV iv3(inv_b3, B[3]);
	ND2 nd3(G3, A[3], inv_b3);
	NR3	nr3(W3, E5, E4, G3);
	// A[5] == B[5], A[4] == B[4], A[3] == B[3] and A[2] is bigger than B[2]
	EO eo3(E3, A[3], B[3]);
	IV iv2(inv_b2, B[2]);
	ND2 nd2(G2, A[2], inv_b2);
	NR4	nr2(W2, E5, E4, E3, G2);
	// A[5] == B[5], A[4] == B[4], A[3] == B[3], A[2] == B[2] and A[1] is bigger than B[1]
	EO eo2(E2, A[2], B[2]);
	IV iv1(inv_b1, B[1]);
	ND2 nd1(G1, A[1], inv_b1);
	NR3 nr_t1(T1, E5, E4, E3);
	NR2 nr_t2(T2, E2, G1);
	AN2 an_w1(W1, T1, T2);
	// A[5] == B[5], A[4] == B[4], A[3] == B[3], A[2] == B[2], A[1] == B[1] and A[0] is bigger than B[0]
	EO eo1(E1, A[1], B[1]);
	IV iv0(inv_b0, B[0]);
	ND2 nd0(G0, A[0], inv_b0);
	NR3 nr0(T3, E2, E1, G0);
	AN2 an_W0(W0, T1, T3);
	// combine
	NR3 nrall1(T4 ,W5, W4, W3);
	NR3 nrall2(T5 ,W2, W1, W0);
	ND2 ndall(G, T4, T5);
endmodule

module selector(Z, A, B, C, D, E, CTRL);
	input [5:0] A, B, C, D, E;
	input [2:0] CTRL;
	output [5:0] Z;
	wire [5:0] S1, S2, S3;
	// bit[0]
	MUX21H mux001(S1[0], A[0], B[0], CTRL[0]);
	MUX21H mux023(S2[0], C[0], D[0], CTRL[0]);
	MUX21H mux00123(S3[0], S1[0], S2[0], CTRL[1]);
	MUX21H mux0all(Z[0], S3[0], E[0], CTRL[2]);
	// bit[1]
	MUX21H mux101(S1[1], A[1], B[1], CTRL[0]);
	MUX21H mux123(S2[1], C[1], D[1], CTRL[0]);
	MUX21H mux10123(S3[1], S1[1], S2[1], CTRL[1]);
	MUX21H mux1all(Z[1], S3[1], E[1], CTRL[2]);
	// bit[2]
	MUX21H mux201(S1[2], A[2], B[2], CTRL[0]);
	MUX21H mux223(S2[2], C[2], D[2], CTRL[0]);
	MUX21H mux20123(S3[2], S1[2], S2[2], CTRL[1]);
	MUX21H mux2all(Z[2], S3[2], E[2], CTRL[2]);
	// bit[3]
	MUX21H mux301(S1[3], A[3], B[3], CTRL[0]);
	MUX21H mux323(S2[3], C[3], D[3], CTRL[0]);
	MUX21H mux30123(S3[3], S1[3], S2[3], CTRL[1]);
	MUX21H mux3all(Z[3], S3[3], E[3], CTRL[2]);
	// bit[4]
	MUX21H mux401(S1[4], A[4], B[4], CTRL[0]);
	MUX21H mux423(S2[4], C[4], D[4], CTRL[0]);
	MUX21H mux40123(S3[4], S1[4], S2[4], CTRL[1]);
	MUX21H mux4all(Z[4], S3[4], E[4], CTRL[2]);
	// bit[5]
	MUX21H mux501(S1[5], A[5], B[5], CTRL[0]);
	MUX21H mux523(S2[5], C[5], D[5], CTRL[0]);
	MUX21H mux50123(S3[5], S1[5], S2[5], CTRL[1]);
	MUX21H mux5all(Z[5], S3[5], E[5], CTRL[2]);
endmodule