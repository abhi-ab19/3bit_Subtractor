module half_sub (Diff, Bout, X, Y);
  output Diff,Bout;
  input X,Y;
  assign Diff=X^Y;
  assign Bout=(~X)&Y;
endmodule

module full_sub_3bit (Sub, BO, A, B, BI);
  output[2:0]Sub;
  output BO;
  input[2:0]A,B;
  input BI;
  wire [2:0]dif;
  wire[2:0]bout1;
  wire[2:0]bout2;
  wire[1:0]BOO;
  half_sub m1(dif[0],bout1[0],A[0],B[0]);
  half_sub m2(Sub[0],bout2[0],dif[0],BI);
  or m3(BOO[0],bout1[0],bout2[0]);
  
  half_sub m4(dif[1],bout1[1],A[1],B[1]);
  half_sub m5(Sub[1],bout2[1],dif[1],BOO[0]);
  or m6(BOO[1],bout1[1],bout2[1]);
  
  half_sub m7(dif[2],bout1[2],A[2],B[2]);
  half_sub m8(Sub[2],bout2[2],dif[2],BOO[1]);
  or m9(BO,bout1[2],bout2[2]);
  
endmodule
