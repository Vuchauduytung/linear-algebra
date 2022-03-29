function [P,L,U] = PLU(A)
    [m,n] = size(A);
    L = diag(ones(m,1));
    P = diag(ones(m,1));
    U = A;
    for jj=1:m-1
        for col=jj:n
            idx = U(jj:end, col)~=0;
            if any(idx~=0)
                break
            end
        end
        pos = find(idx,1)+jj-1;
        if pos ~= 1
            U([jj pos], :) = U([pos jj], :);
            P([jj pos], :) = P([pos jj], :);
            if jj~=1
                L([jj pos], :) = L([pos jj], :);
                L(:, [jj pos]) = L(:, [pos jj]);
            end
        end
        cof = U(jj+1:end, col)/U(jj, col);
        L(jj+1:end, jj) = cof;
        for ii=jj+1:m
            U(ii, :) = U(ii, :) - cof(ii-jj)*U(jj, :);
        end
    end
