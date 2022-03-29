function X = sof_solve(A,b)
    [P,L,U] = PLU(A);
    Y = L\(P*b);
    X = U\Y;