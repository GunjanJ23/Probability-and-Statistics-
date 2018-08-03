%A.
%Creating square and circle and having random points within

clear all;
clc;
P = zeros(1,500);


for N = 1:500
x=rand(1,N);
y=rand(size(x));
theta=linspace(0,2*pi);
xc=1*cos(theta);
yc=1*sin(theta);
in = inpolygon(x,y,xc,yc);
P(N)=4*sum(in)/N;
end
i = 1:500;
j = P(i);
plot(i,j);

%B. 
%Integrate for n =1,2,3,4,5
clear all;
Q = zeros(1,5);
for i =0:5
x=i:0.1:i+1;
y= sinc(x);                           
Q(i+1) = trapz(x,y); 
end
integrate = pi*Q;


%For n =100
clear all;
Q = zeros(1,1);
for i =0:100
x=0:0.1:i;
y= sinc(x);                           
Q = trapz(x,y); 
end
integrate = pi*Q;
 
%For n = 1000
Q' = zeros(1,1);
for i =0:1000
x'=0:0.1:i;
y'= sinc(x);                           
Q' = trapz(x,y); 
end
integrate' = pi*Q';
 
%For n = 100000
Q'' = zeros(1,1);
for i =0:100000
x=0:0.1:i;
y= sinc(x);                           
Q'' = trapz(x,y); 
end
integrate'' = pi*Q'';



    
%C.

%Probabilites of different poker hands
clear all;
deck=randperm(52);
hand=deck(1:5);
 
straightflush=40;
fourofakind=13*48;
fullhouse=13*12*4*nchoosek(4,2);
flush=4*nchoosek(13,5)-40;
straight=10*4^5-40;
threeofakind=13*4*48*44/2;
twopair=nchoosek(13,2)*nchoosek(4,2)*nchoosek(4,2)*44;
pair=13*nchoosek(4,2)*48*44*40/factorial(3);
squat=nchoosek(13,5)*4^5-straight-flush-straightflush;
hands=[straightflush,fourofakind,fullhouse,flush,straight,threeofakind,twopair,pair,squat];
total=sum(hands);
totalshouldbe=nchoosek(52,5);
probabilities=hands/total;
