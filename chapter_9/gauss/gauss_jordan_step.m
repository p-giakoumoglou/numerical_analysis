function A1=gauss_jordan_step(A,i) % calling of fuction function 
    disp('Call gauss_jordan_step ...')
    [n,m]=size(A); % determination of size of matrix A 
    A1=A; % assigning A to A1 
    s=A1(i,1);
    A1(i,:) = A(i,:)/s;
    disp(['[A|b](',num2str(i),',:) = [A|b](',num2str(i),',:) / (',num2str(s),')'])
    disp(['[A|b] = ']); disp(A1)
    %k=[[1:i-1],[i+1:n]];
    k=[[i+1:n]];
    for j=k
        s=A1(j,1);
        A1(j,:)=A1(j,:)-A1(i,:)*s;
        disp(['[A|b](',num2str(j),',:) = [A|b](',num2str(j),',:) - [A|b](',num2str(i),',:) * (',num2str(s),')'])
    end % end of for loop 
end