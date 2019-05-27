function [x]=MetGaussPT(A,b)
n=length(b);
A=[A,b];
index=1:n;
for k=1:n-1
    p=k;
    m=k;
    max=abs(A(p,m));
    for i=k:n
        for j=k:n
            if abs (A(i,j))>max
                max=abs (A(i,j));
                p=i;
                m=j;
            end
        end
    end
    if A(p,m)==0 
        fprintf('Sistem incompatibil sau compatibil nedet')
        return
    end
    if p~=k
        A([p,k],:)=A([k,p],:);
    end 
    if m~=k 
        A(:,[m,k])=A(:,[k,m]);
        index ([m,k])=index([k,m]);
    end
    for l=k+1:n
        mlk=A(l,k)/A(k,k);
        A(l,:)=A(l,:)-mlk*A(k,:);
    end
end
if A(n,n)==0
    fprintf('Sistem incompatibil sau compatibil nedet')
    return
end
y=subsDesc(A(1:n,1:n),A(1:n,n+1));
for i=1:n
    x(index(i))=y(i);
end
end
    