function [x,err]=gauss_jordan_elim(A,b)
    [n,m]=size(A); % finding the size of matrix A 
    err =0; % calculation of error 
    x=zeros(n,1); % calling fuction zero
    if err == 0
        Aa=[A,b]; 
        for i=1:n 
            disp(['*************** Iteration ',num2str(i),' ***************'])
            [Aa(i:n,i:n+1),err]=gauss_pivot(Aa(i:n,i:n+1));
            disp('[A|b]= '); disp(Aa);
            if err == 0
                Aa(1:n,i:n+1)=gauss_jordan_step(Aa(1:n,i:n+1),i);
                disp('[A|b] = '); disp(Aa);
            end
        end
        x=Aa(:,n+1);
    end
    A=0;
end