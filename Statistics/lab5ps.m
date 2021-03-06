
% lab 5

% a)

% a) Assuming that past experience indicates that σ= 5, find a 100(1−α)% confidence interval for the average number of files stored.

X=[7 7 4 5 9 9 ...
   4 12 8 1 8 7 ...
   3 13 2 1 17 7 ...
   12 5 6 2 1 13 ...
   14 10 2 4 9 11 ...
   3 5 12 6 10 7];
   
conflevel=input('a) conf level(in(0,1)='); %1-alfa
alfa=1-conflevel;
sigma = 5;
n=length(X);
xbar=mean(X);

q1= norminv(1-alfa/2,0,1);
q2= norminv(alfa/2,0,1); 
ci1=xbar-(sigma/(sqrt(n)))*q1;
ci2=xbar-(sigma/(sqrt(n)))*q2;
fprintf('Confidence interval is (% 3.5f, %3.5f)\n',ci1,ci2)



% b Assuming nothing is known about σ, find a 100(1−α)% confidence interval for the average number of files stored.


conflevel=input('b) conf level(in(0,1)='); %1-alfa
alfa=1-conflevel;
X=[7 7 4 5 9 9 ...
   4 12 8 1 8 7 ...
   3 13 2 1 17 7 ...
   12 5 6 2 1 13 ...
   14 10 2 4 9 11 ...
   3 5 12 6 10 7];
s=std(X); %case sigma unknown 
n=length(X);
xbar=mean(X);

q1= tinv(1-alfa/2,n-1);
q2= tinv(alfa/2,n-1); %q2=q1
ci1=xbar-(s/(sqrt(n)))*q1;
ci2=xbar-(s/(sqrt(n)))*q2;%q2=q1 sym/
fprintf('C.I for the pop. mean, miu, case sigma unknown(general case) is (% 3.5f, %3.5f)\n',ci1,ci2)



% c)
  
%Assuming the number of files stored are approximately normally distributed, find100(1−α)% confidence intervals for the variance and for the standard deviation.

conflevel=input('c) conf level(in(0,1)='); %1-alfa
alfa=1-conflevel;

X=[7 7 4 5 9 9 ...
   4 12 8 1 8 7 ...
   3 13 2 1 17 7 ...
   12 5 6 2 1 13 ...
   14 10 2 4 9 11 ...
   3 5 12 6 10 7];
svar=var(X); %S^2

s=std(X); %case sigma jnown 
n=length(X);
xbar=mean(X);

q1= tinv(1-alfa/2,n-1);
q2= tinv(alfa/2,n-1); %q2=q1
ci1=((n-1)*svar)/q1;
ci2=((n-1)*svar)/q2;
fprintf('C.I for the pop. variance sigma^2 is (% 3.5f, %3.5f)\n',ci1,ci2)
fprintf('C.I for the std dev sigma square root',sqrt(svar))









