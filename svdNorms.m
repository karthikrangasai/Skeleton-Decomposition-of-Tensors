function N = svdNorms(A, size)

    [U S V] = svd(A);
    
    n = randi(size)/2;

    normsArray = zeros(1,n);
    
    k = sort(randi(size,[1,n]));
    S_test = zeros(size);
    
    for i=1:n
        for j=1:k(i)
            S_test(:,j) = S(:,j);
        end
        
        reconstruct = U * S_test * V';
        normsArray(i) = norm((A - reconstruct), inf);
    end
    
    N = normsArray;
end