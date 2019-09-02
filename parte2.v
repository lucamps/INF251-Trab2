/*
******************* Alu 2 *****************| 
c1    c0               d1  d2  d3  d4  d5  |
 0     0      A+B       x   x   x   0   1  |
 0     1      A+B+1     x   x   x   1   1  |
 1     0      A&B       1   0   0   x   0  |
 1     1      A^B       0   1   1   x   0  |
*/


module alu2_altonivel(input [3:0] a,b, input [1:0] c, output [3:0] F);
  wire [3:0] F1,F0; 
  assign F = ( c[1] )? F1 : F0 ;
  assign F0 = ( c[0]  )? a+b+1 : a+b;
  assign F1 = ( c[0]  )? a^b : a&b ;
endmodule 

module alu2(input [3:0] a,b, input [1:0] c, output [3:0] F);
  wire [3:0] And1, And2, And3, And4, Xor1, Xor2, Add;
  wire d1,d2,d3,d4,d5;

  assign d1 = ~c[0];
  assign d2 = c[0]; 
  assign d3 = c[0];
  assign d4 = c[0];
  assign d5 = ~c[1];

  assign And1 = a & And2;
  assign And2 = b & {4{d1}};
  assign And3 = {4{d2}} & a;
  assign And4 = {4{d3}} & b;
  assign Xor1 = And1 ^ Xor2;
  assign Xor2 = And4 ^ And3;
  assign Add = a + b + d4;
  assign F = (d5)?Add:Xor1;

endmodule

module testbench;
    reg [3:0] a,b;
    reg [1:0] c;
    wire [3:0] f1,f2;
    alu2_altonivel M1(a,b,c,f1);
    alu2 M2(a,b,c,f2);
    integer i;     
    initial begin
                
    $monitor(" a=%d,b=%d c=%d f1 %d f2 %d",a,b,c,f1,f2);
      for (i=0; i < 1024; i=i+1)
	      begin 
          a= i[9:6]; b = i[5:2]; c = i[1:0]; #1;
          if ( f1 !== f2 ) $display("Falha ! a=%d b=%d c %d",a,b,c);
      end  // for 
    end  // initial
     
    endmodule
