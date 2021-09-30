A = linsys1.A;
B = linsys1.B;
C = linsys1.C;
D = linsys1.D;
[num, den] = ss2tf(A, B, C, D);
tf = minreal(tf(num, den))