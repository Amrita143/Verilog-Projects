
module SR_FF(
    input preset,clk,S,R,
    output reg Q
);
always @(negedge clk) begin
    if(preset==0)
    begin
       Q<=0;
   end
   else
    begin
     if(S==1 & R==0)
   begin
       Q<=1;
   end
   else if(S==0 & R==1)
   begin
       Q<=0;
   end
  
   end
  
  

end
endmodule

module testbench();

reg clk,preset;
wire S0,R0,Q0,S1,R1,Q1,S2,R2,Q2,S3,R3,Q3;

assign S0= ~(Q1^Q2^Q3);
assign S1= Q0 & ~(Q2^Q3);
assign S2= (~Q3)&Q1&(~Q0);
assign S3=Q2 & (~Q1) & (~Q0);
assign R0= Q1^Q2^Q3;
assign R1= (Q2^Q3)&Q0;
assign R2= Q1&(~Q0)&Q3;
assign R3 = (~Q2)&(~Q1)&(~Q0);


SR_FF ff0(preset,clk,S0,R0,Q0);
SR_FF ff1(preset,clk,S1,R1,Q1);
SR_FF  ff2(preset,clk,S2,R2,Q2);
SR_FF  ff3(preset,clk,S3,R3,Q3);

initial begin
$monitor("Q3=%b Q2=%b Q1=%b Q0=%b ",Q3,Q2,Q1,Q0); 
$dumpfile("amrita.vcd");
$dumpvars(0,testbench);
 
 
 clk=0;preset=0;#1;
 clk=1;preset=0;#1;
 clk=0;preset=0;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=1;preset=1;#1;
 clk=0;preset=1;#1;
 clk=0;preset=1;#1;
 clk=0;preset=1;#1;
 clk=0;preset=1;#1;

 


$finish;
end
endmodule