function [ C ] = matrixmultserial( A,B )        %code for matrix multiplication in serial
[m,n]=size(A);
[k,l]=size(B);
if(n~=k) || m==0 || k==0
    C=[];
    disp('Error, not able to multiply matrices');
    return
end
C=zeros(m,l);
       for i=1:m;
        for j=1:l;
            for p=1:n;
                flag=1;
                C(i,j)=C(i,j)+ A(i,p)*B(p,j);
            end            
        end
    end
end