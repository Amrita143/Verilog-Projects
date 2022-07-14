`timescale 1s/1s
module mux(
    input s0,s1,I0,I1,I2,I3,
    output Y
);
assign Y= ((~s1)&(~s0)&(I0)) | ((~s1)&(s0)&(I1)) | ((s1)&(~s0)&(I2)) | ((s1)&(s0)&(I3)) ;
endmodule

module testbench();
reg A,B,C,D ;
wire s0,s1,s2,I0,I1,I2,I3,I4,I5,I6,I7,t1,t2,y;
assign s2=B;
assign s1=C;
assign s0=D;
assign I0=1;
assign I1=1;
assign I2=(~A);
assign I3=A;
assign I4=0;
assign I5=1;
assign I6=1;
assign I7=A;
mux m1(s0,s1,I0,I1,I2,I3,t1) ;
mux m2(s0,s1,I4,I5,I6,I7,t2);
assign y=(t1 & (~s2)) | (t2 & s2) ;

initial begin
$monitor("A=%b B=%b C=%b D=%b y=%b",A,B,C,D,y);
$dumpfile("amrita.vcd");
$dumpvars(0,testbench);
 A=0;B=0;C=0;D=0;#2;
 A=0;B=0;C=0;D=1;#2;
A=0;B=0;C=1;D=0;#2;
A=0;B=0;C=1;D=1;#2;
A=0;B=1;C=0;D=0;#2;
A=0;B=1;C=0;D=1;#2;
A=0;B=1;C=1;D=0;#2;
A=0;B=1;C=1;D=1;#2;
A=1;B=0;C=0;D=0;#2;
A=1;B=0;C=0;D=1;#2;
A=1;B=0;C=1;D=0;#2;
A=1;B=0;C=1;D=1;#2;
A=1;B=1;C=0;D=0;#2;
A=1;B=1;C=0;D=1;#2;
A=1;B=1;C=1;D=0;#2;
A=1;B=1;C=1;D=1;#2;


$finish;
end
endmodule


