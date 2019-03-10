function [d, A, k, c, C, r, R, M] = skeletonDecomp(s, rank)
    
    x = 0:1/s:1;
    y = 0:1/s:1;
    A = zeros(s);
    
    for i=1:s
        for j=1:s
            A(i,j) = 1.0/(1.0 + x(i)^2 + y(j)^2);
        end
        %fprintf('%d - Assigning values to A \n', count)
    end
    %fprintf('A is done \n')
    
    k = rank;
    c = sort(randperm(s,k));
    C = zeros(s,k);
    M = zeros(k,k);
    R = zeros(k,s);
    %fprintf('\nC M R init done \n')
    
    for i=1:k
        C(:,i) = A(:,c(i));
    end
    %fprintf('C is done \n')
    
    r = maxvol2(C);
    %fprintf('maxvol is done \n')
    
    for i=1:k
        R(i,:) = A(r(i),:);
    end
    %fprintf('R is done \n')
    
    for i=1:k
        for j=1:k
            M(i,j) = A(r(i),c(j));
        end
    end
    %fprintf('M is done \n')
    
    M_in = inv(M);
    
    T = C * M_in * R;
    
    %d = norm((A - T), inf);
    d = max(max(abs(A - T)));
end