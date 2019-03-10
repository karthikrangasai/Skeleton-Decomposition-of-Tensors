function [d, A, k, c, C, r, R, M, T] = skeletonDecompMatUneven(A, rank)

    [row, col] = size(A);
    k = rank;
    
    c = sort(randperm(col,k));
    C = zeros(row,k);
    
    
    for i=1:k
        C(:,i) = A(:,c(i));
    end
        
    r = maxvol2(C);
        
    M = zeros(k,k);
    R = zeros(k,col);
    
    for i=1:k
        R(i,:) = A(r(i),:);
    end
    
    for i=1:k
        for j=1:k
            M(i,j) = A(r(i),c(j));
        end
    end
    
    M_in = inv(M);
    
    T = C * M_in * R;
    
    %d = norm((A - T), inf);
    d = max(max(abs(A - T)));
end