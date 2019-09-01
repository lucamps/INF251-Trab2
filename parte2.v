/*
********** Alu 2 ************** | 
c1 0  c0 0      A+B             |
c1 0  c0 1      A+B+1           |
c1 1  c0 0      A&B             |
c1 1  c0 1      A^B             |
*/


module alu2_altonivel(input [3:0] a,b, input [1:0] c, output [3:0] F);
  wire [3:0] F1,F0; 
  assign F = ( c[1] )? F1 : F0 ;
  assign F0 = ( c[0]  )? a+b+1 : a+b;
  assign F1 = ( c[0]  )? a^b : a&b ;
endmodule 

/*module alu2(input [3:0] a,b, input [1:0] c, output [3:0] F);  //Errado
  wire [3:0] And, Add;
  wire d1,d2;

  assign d1 = c[0] & ~c[1];
  assign d2 = (~c[0] & c[1]); 

  assign And = a & b;
  assign Add = a + b + d1;
  assign F = (d2)?Add:And;

endmodule */

module testbench();
   
endmodule
