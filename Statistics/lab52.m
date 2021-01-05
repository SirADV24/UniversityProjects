
% a)

conflevel=input('a) conf level(in(0,1)='); %1-alfa
alfa=1-conflevel;

X1=[22.4 21.7 ...
    24.5 23.4 ...
    21.6 23.3 ...
    22.4 21.6 ...
    24.8 20.0];
X2=[17.7 14.8 ...
    19.6 19.6 ...
    12.1 14.8 ...
    15.4 12.6 ...
    14.0 12.2];
    
    
n1=length(X1);
n2=length(X2); 

xbar1=mean(X1);
xbar2=mean(X2);

svar1=var(X1);%s1^2
svar2=var(X2);%s2^2

spsq=((n1-1)*svar1+(n2-1)*svar2)/(n1+n2-2);

q1=tinv(1-alfa/2,n1+n2-2);
q2=tinv(alfa/2,n1+n2-2); %q2=q1

ci1=xbar1-xbar2-q1*sqrt(spsq)*sqrt(1/n1+1/n2);
ci2=xbar1-xbar2-q2*sqrt(spsq)*sqrt(1/n1+1/n2);

fprintf('C.I for the diff. of the pop. mean case sigma1=sigma2 (% 3.5f, %3.5f)\n',ci1,ci2)


% b)

conflevel=input('b) conf level(in(0,1)='); %1-alfa
alfa=1-conflevel;
X1=[22.4 21.7 ...
    24.5 23.4 ...
    21.6 23.3 ...
    22.4 21.6 ...
    24.8 20.0];
X2=[17.7 14.8 ...
    19.6 19.6 ...
    12.1 14.8 ...
    15.4 12.6 ...
    14.0 12.2];

n1=length(X1);
n2=length(X2); 


xbar1=mean(X1);
xbar2=mean(X2);

svar1=var(X1);%s1^2
svar2=var(X2);%s2^2

spsq=((n1-1)*svar1+(n2-1)*svar2)/(n1+n2-2);

q1=tinv(1-alfa/2,n);
q2=tinv(alfa/2,n); %q2=q1

ci1=xbar1-xbar2-q1*sqrt(svar1/n1+svar2/n2);
ci2=xbar1-xbar2-q2*sqrt(svar1/n1+svar2/n2);

fprintf('C.I for the diff. of the pop. mean case sigma1!=sigma2 (% 3.5f, %3.5f)\n',ci1,ci2)



%c)