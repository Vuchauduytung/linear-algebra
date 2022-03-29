function [L,U] = LU(A)
    [P,L,U] = PLU(A);
    L = P*L;