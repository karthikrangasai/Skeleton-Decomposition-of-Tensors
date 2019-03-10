function [A, x, y, N, D, timeSVD, timeCMR] = skeleton_svd_comparision(size)

    %A = rand(size);
    count = 0;
    
    x = 0:1/size:1;
    
    y = 0:1/size:1;
    
    
    A = zeros(size);
    
    for i=1:size
        for j=1:size
            A(i,j) = x(i)^2 + y(j)^2;
        end
        count = count + 1;
        fprintf('%d - Assigning values to A \n', count)
    end
    fprintf('A is done \n')

    tic
    N = svdNorms(A, size);
    timeSVD = toc
    
    tic
    D = skeletonDecomp(A, size);
    timeCMR = toc

end