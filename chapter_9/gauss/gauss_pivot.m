function [A1,err]=gauss_pivot(A) % calling of fucntion 
    disp('Call gauss_pivot ...')
    [n,m]=size(A); % finding the size of matrix A
    A1=A; % process of assigning 
    err = 0; % error flag
    if A1(1,1) == 0
        check = logical(1); % logical(1) - TRUE
        i = 1;
        while check
            i = i + 1;
            if i > n  
                disp('error: matrix is singular');
                err = 1;
                check = logical(0);
            else
                if A(i,1) ~= 0 & check
                    check = logical(0);
                    b=A1(i,:);      % process to change row 1 to i 
                    A1(i,:)=A1(1,:);
                    A1(1,:)=b;
                end
            end
        end
    end
end