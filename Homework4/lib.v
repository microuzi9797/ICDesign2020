`timescale 1ns/1ps

module AN3(Z,A,B,C,number);
	  output Z;
	   input A,B,C;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd8;



	   // netlist
	   and g1(Z,A,B,C);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.275;
		   specparam Tp_B_Z = 0.275;
		   specparam Tp_C_Z = 0.275;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
	   endspecify

endmodule
module AN4(Z,A,B,C,D,number);
	  output Z;
	   input A,B,C,D;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd10;
	   // netlist
	   and g1(Z,A,B,C,D);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.371;
		   specparam Tp_B_Z = 0.371;
		   specparam Tp_C_Z = 0.371;
		   specparam Tp_D_Z = 0.371;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
		   ( D *> Z ) = ( Tp_D_Z );
	   endspecify
endmodule

module AN2(Z,A,B,number);
			output Z;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd6;
	   // netlist
	   and g1(Z,A,B);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.225;
		   specparam Tp_B_Z = 0.225;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
	   endspecify
endmodule
module DRIVER(Z,A,number);
			output Z;
	   input A;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd4;
	   // netlist
	   buf g1(Z,A);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.174;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
	   endspecify
endmodule


module DRIVER2(Z,A,number);
		  output Z;
	   input A;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd4;
	   // netlist
	   buf g1(Z,A);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.178;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
	   endspecify
endmodule

module EN(Z,A,B,number);
		   output Z;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd8;
	   // netlist
	   xnor g1(Z,A,B);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 1.10;
		   specparam Tp_B_Z = 0.98;


		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );

	   endspecify
endmodule

module EN3(Z,A,B,C,number);
		   output Z;
	   input A,B,C;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd14;
	   // netlist
	   xnor g1(Z,A,B,C);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 1.10;
		   specparam Tp_B_Z = 0.98;
		   specparam Tp_C_Z = 0.75;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
	   endspecify
endmodule


module EO(Z,A,B,number);
		 output Z;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd8;
	   xor u0(Z,A,B);
	   // specify block
specify
specparam Tp_A_Z=0.343;
specparam Tp_B_Z=0.308;
( A *> Z ) = ( Tp_A_Z,Tp_A_Z );
( B *> Z ) = ( Tp_B_Z,Tp_B_Z );
endspecify
endmodule


module EO3(Z,A,B,C,number);
		   output Z;
	   input A,B,C;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd14;
	   // netlist
	   xor g1(Z,A,B,C);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.82;
		   specparam Tp_B_Z = 0.78;
		   specparam Tp_C_Z = 0.61;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
	   endspecify
endmodule

module FA1(CO,S,A,B,CI,number);
	   output S,CO;
	   input A,B,CI;

	   wire x = (A&B)||(B&CI)||(A&CI);
	   // netlist
	   xor g1(S,A,B,CI);
	   buf g2(CO,x);
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd26;
	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_S = 0.61;
		   specparam Tp_B_S = 0.54;
		   specparam Tp_C_S = 0.43;

		   specparam Tp_A_O = 0.55;
		   specparam Tp_B_O = 0.55;
		   specparam Tp_C_O = 0.54;

		   // path delay
		   ( A *> S ) = ( Tp_A_S );
		   ( B *> S ) = ( Tp_B_S );
		   ( CI *> S ) = ( Tp_C_S );
		   ( A *> CO ) = ( Tp_A_O );
		   ( B *> CO ) = ( Tp_B_O );
		   ( CI *> CO ) = ( Tp_C_O );
	   endspecify
endmodule

module FD1(Q,D,CLK,RESET,number);
		   output Q;
	   input D,CLK,RESET;
	   reg Q,realD,realRESET;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd27;
	   always @D
	   begin
		 realD=1'bx;
		 #0.581 realD=D;
	   end

	   always @(negedge RESET)
	   begin
		 realRESET=0;
		 #0.248 Q =1'b0;
	   end

	   always @(posedge RESET)
		#0.176 realRESET=1;
	  always @(negedge CLK) Q =#0.441 (realD&realRESET);
endmodule

module FD2(Q,D,CLK,RESET,number);
		   output Q;
	   input D,CLK,RESET;
	   reg Q,realD,realRESET;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd27;
	   always @D
	   begin
		 realD=1'bx;
		 #0.581 realD=D;
	   end

	   always @(negedge RESET)
	   begin
		 realRESET=0;
		 #0.248 Q =1'b0;
	   end

	   always @(posedge RESET)
		#0.176 realRESET=1;
	  always @(posedge CLK) Q =#0.441 (realD&realRESET);
endmodule

module HA1(O,S,A,B,number);
		 output S,O;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd14;
	   // netlist
	   xor g1(S,A,B);
	   and g2(O,A,B);


	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_S = 0.39;
		   specparam Tp_B_S = 0.37;

		   specparam Tp_A_O = 0.18;
		   specparam Tp_B_O = 0.18;

		   // path delay
		   ( A *> S ) = ( Tp_A_S );
		   ( B *> S ) = ( Tp_B_S );
		   ( A *> O ) = ( Tp_A_O );
		   ( B *> O ) = ( Tp_B_O );
	   endspecify
endmodule

module IV(Z,A,number);
		  output Z;
	   input A;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd2;
	   // netlist
	   not g1(Z,A);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.127;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
	   endspecify
endmodule

module MUX21H(Z,A,B,CTRL,number);
			output Z;
	   input A,B,CTRL;
	   wire w;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd12;
	   // netlist
	assign w=(CTRL)?B:A;
	buf g1(Z,w);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.316;
		   specparam Tp_B_Z=0.337;
		   specparam Tp_CTRL_Z = 0.347;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( CTRL *> Z ) = ( Tp_CTRL_Z );
	   endspecify
endmodule

module ND2(Z,A,B,number);
		 output Z;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd4;
	   // netlist
	   nand g1(Z,A,B);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.176;
		   specparam Tp_B_Z = 0.176;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
	   endspecify
endmodule

module ND3(Z,A,B,C,number);
	   output Z;
	   input A,B,C;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd6;
	   // netlist
	   nand g1(Z,A,B,C);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.226;
		   specparam Tp_B_Z = 0.226;
		   specparam Tp_C_Z = 0.226;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
	   endspecify
endmodule
module ND4(Z,A,B,C,D,number);
	   output Z;
	   input A,B,C,D;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd8;
	   // netlist
	   nand g1(Z,A,B,C,D);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.296;
		   specparam Tp_B_Z = 0.296;
		   specparam Tp_C_Z = 0.296;
		   specparam Tp_D_Z = 0.296;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
		   ( D *> Z ) = ( Tp_D_Z );
	   endspecify
endmodule
module NR2(Z,A,B,number);
		output Z;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd4;
	   // netlist
	   nor g1(Z,A,B);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.227;
		   specparam Tp_B_Z = 0.227;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
	   endspecify
endmodule

module NR3(Z,A,B,C,number);
	   output Z;
	   input A,B,C;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd6;
	   // netlist
	   nor g1(Z,A,B,C);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.349;
		   specparam Tp_B_Z = 0.349;
		   specparam Tp_C_Z = 0.349;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
	   endspecify
endmodule

module NR4(Z,A,B,C,D,number);
	  output Z;
	   input A,B,C,D;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd8;
	   // netlist
	   nor g1(Z,A,B,C,D);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.345;
		   specparam Tp_B_Z = 0.345;
		   specparam Tp_C_Z = 0.345;
		   specparam Tp_D_Z = 0.345;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
		   ( D *> Z ) = ( Tp_D_Z );
	   endspecify
endmodule

module OR2(Z,A,B,number);
	   output Z;
	   input A,B;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd6;
	   // netlist
	   or g1(Z,A,B);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.297;
		   specparam Tp_B_Z = 0.300;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
	   endspecify
endmodule

module OR3(Z,A,B,C,number);
	   output Z;
	   input A,B,C;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd8;
	   // netlist
	   or g1(Z,A,B,C);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.430;
		   specparam Tp_B_Z = 0.430;
		   specparam Tp_C_Z = 0.429;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
	   endspecify
endmodule

module OR4(Z,A,B,C,D,number);
		 output Z;
	   input A,B,C,D;
 parameter size = 10'd50;
  output [size:0] number;
  wire  [size:0] number;
  assign number=11'd10;
	   // netlist
	   or g1(Z,A,B,C,D);

	   // specify block
	   specify

		   // delay parameters

		   specparam Tp_A_Z = 0.544;
		   specparam Tp_B_Z = 0.544;
		   specparam Tp_C_Z = 0.540;
		   specparam Tp_D_Z = 0.544;

		   // path delay
		   ( A *> Z ) = ( Tp_A_Z );
		   ( B *> Z ) = ( Tp_B_Z );
		   ( C *> Z ) = ( Tp_C_Z );
		   ( D *> Z ) = ( Tp_D_Z );
	   endspecify
endmodule



