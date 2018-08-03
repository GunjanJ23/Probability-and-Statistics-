%A.
clear all;
clc;
packet = input('Number of packet radios');
p = input('Probability that non empty buffer will transmit');
B = input('Buffer size');
time = input('Simulation time');
ps = input('Probability that new packet is generated');
total = packet*ps;
%intial values
state = zeros(packet,B+10);
lost_value = 0;
Through = 0; %throughput
Delay = 0; %delay
D = zeros(1,time);
B1 = zeros(1,B);
 
for i = 1:time
    r1 = rand(1,packet);
    r2 = rand(1,packet);
    f1 = find(r1<ps);
    f2 = find(r2<p);
    [m1,n1] = find(r1<ps);
    [x1,y1] = find(r2<p);
    [m,n] = size(f1);
    [x,y] = size(f2);
    Delay = Delay+1;
    
    if state ==0
        if n ==1
            if (y==1) &&(r2(y1)<p)
            state = state;
            Through = Through+1;
            D(i) = Delay;
        elseif (y>1) &&((y==1) &&(r2(y1)>p))
            state(n1,y1)=state(n1,y1)+1;
        else
            state(n1(1:n),y1(1:y))=state(n1(1:n),y1(1:y))+1;
        end
        
        
    elseif n>1
        if (y==1)&&(r2(y1)<p)
            state = state;
            Through =Through+1;
            D(i) = Delay;
        elseif y>1 &&((y==1) &&(r2(y1)>p))
            state(n1,y1) = state(n1,y1)+1;
        else
            state(n1(1:n),y1(1:y))= state(n1(1:n), y1(1:y))+1;
        end
    end
    else
        if (y==1)&&(r2(y1)<p)
            state = state;
            Through =Through+1;
            D(i) =Delay;
        elseif (n==0) &&((y==1)&&(r2(y1)<p))
            state(n1,y1) = state(n1,y1)-1;
            Through=Through+1;
            D(i) = Delay;
        else
            state(n1(1:n),y1(1:y)) = state(n1(1:n), y1(1:y))+1;
            if max(state)>B
                lost_value = lost_value+1;
            end
        end
end
end
lost_value 
Through
Average_Delay = mean(diff(find(D>0)))

 
%B    
 
packet = input('Number of packet radios');
p = input('Probability that non empty buffer will transmit');
B = input('Buffer size');
sim_time = input('Simulation time');
lambda = input('Probability that new packet is generated');
Thou = packet*lambda;
%initialization
state = zeros(packet,B+10);
lost_value = 0;
Through = 0; %Throughput
delay = 0; %Delay
D = zeros(1,sim_time);
B1 = zeros(1,B);
 
for i = 1:sim_time
    r1 = rand(1,packet);
    r2 = rand(1,packet);
    f1 = find(r1<lambda);
    f2 = find(r2<p);
    [m1,n1] = find(r1<lambda);
    [x1,y1] = find(r2<p);
    [m,n] = size(f1);
    [x,y] = size(f2);
    delay = delay +1;
    [a,b] = find (state==1);
    f3 = find(state ==1);
    [a1,b1] = size(f3);
    
    state(n1(1:n),y1(1:y))= state(n1(1:n),y1(1:y))+1;
    if (y==1) &&(r2(y1)<p)
         state(n1,y1)=state(n1,y1)-1;
         Through = Through+1;
         D(i) = delay;
    elseif (y==1) && (state(n1,y1)==1)
        state(n1,y1) = state(n1,y1) -1;
        Through = Through +1;
        D(i) = delay;
    else if (y==0) &&(b1 ==1)
            state(b1) = state(b1) -1;
            Through = Through +1;
            D(i) = delay;
   
    else
            state(n1(1:n),y1(1:y))=state(n1(1:n),y1(1:y))+1;
             if max(state)>B
                 [ma, I] = max(state);
                 state(I) = B;
                lost_value = lost_value+1;
             end
        end
    end
end
 
lost_value 
Through
Average_Delay = mean(diff(find(D>0)))
 
