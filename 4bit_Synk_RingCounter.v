module D_FF(
    input preset,clear,clk,D,
    output reg Q
);
always @(negedge clk) begin
    if(preset==0)
    begin
       Q<=1;
   end
   else if(clear==0)
   begin
     Q<=0;
   end
   else if(preset==1 & clear==1)
    begin
     if(D==0)
   begin
       Q<=0;
   end
   else if( D==1)
   begin
       Q<=1;
   end
  
   end
  
  

end
endmodule

module testbench();
reg clk,ORI;
wire D0,D1,D2,D3,Q0,Q1,Q2,Q3,preset,clear;

assign preset =1;
assign clear=1;
assign D3=Q0^Q1;
assign D2=Q3;
assign D1=Q2;
assign D0=Q1;


D_FF  f3(preset,ORI,clk,D3,Q3);
D_FF  f2(preset,ORI,clk,D2,Q2);
D_FF  f1(preset,ORI,clk,D1,Q1);
D_FF  f0(ORI,clear,clk,D0,Q0);


initial begin
$monitor("Q3=%b Q2=%b Q1=%b Q0=%b ",Q3,Q2,Q1,Q0); 
$dumpfile("amrita.vcd");
$dumpvars(0,testbench);
 
 
 clk=0;ORI=0;#1;
 clk=1;ORI=0;#1;
 clk=0;ORI=0;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 clk=1;ORI=1;#1;
 clk=0;ORI=1;#1;
 

 


$finish;
end
endmodule

