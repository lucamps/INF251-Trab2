/*
c1 0  c0 0      A+B+1
c1 0  c0 1      A
c1 1  c0 0      A&B
c1 1  c0 1      A-B = A+(~B+1)
*/


module altonivel(input signed [5:0] a,b, input [1:0] c, output signed[5:0] F);
  wire signed [5:0] F1,F0; 
  assign F = ( c[1] )? F1 : F0 ;
  assign F0 = ( c[0]  )? a : a+b+1;
  assign F1 = ( c[0]  )? a-b : a&b ;
endmodule 
