/*
********** Alu 1 ************** | 
c1 0  c0 0      A+B+1           |
c1 0  c0 1      A               |
c1 1  c0 0      A&B             |
c1 1  c0 1      A-B = A+(~B+1)  |
*/


module alu1_altonivel(input signed [5:0] a,b, input [1:0] c, output signed[5:0] F);
  wire signed [5:0] F1,F0; 
  assign F = ( c[1] )? F1 : F0 ;
  assign F0 = ( c[0]  )? a : a+b+1;
  assign F1 = ( c[0]  )? a-b : a&b ;
endmodule 

module alu1(input [5:0] a,b, input [1:0] c, output [5:0] F);
  wire [5:0] And, Xor, AndB, Add;
  wire d1,d2,d3,d4;

  assign d1 = c[1];
  assign d2 = (~c[1]&~c[0])|(c[1]); 
  assign d3 = (~c[1]&~c[0])|(c[1]&c[0]);
  assign d4 = (~c[1]&~c[0])|(c[0]&~c[1])|(c[0]&c[1]);

  assign And = a & b;
  assign Xor = b ^ {6{d1}};
  assign AndB = Xor & {6{d2}};
  assign Add = a + AndB + d3;
  assign F = (d4)?Add:And;

endmodule 
