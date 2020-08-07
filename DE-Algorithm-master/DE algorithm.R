



NumOfVar=5
Dim=NumOfVar+1
SwarmNum=100
CR=0.85
F=0.95
iteration=10

#load data
setwd("/Users/amin")
DataPoints <- read.csv("DataPoints", header = T)





# RandMat=rand(NumOfVar,SwarmNum)
RandMat=matrix(runif(NumOfVar*SwarmNum, min=0, max=1),NumOfVar,SwarmNum)
# inipoints=zeros(NumOfVar,SwarmNum);
inipoints=matrix(0,NumOfVar,SwarmNum)


%Variables ranges
%change num of para+1
%aa1
VarL(1)=0;VarU(1)=100;
%aa2
VarL(2)=0;VarU(2)=1000;
%aa3
VarL(3)=0;VarU(3)=100;
%aa4
VarL(4)=0;VarU(4)=2;
%aa5
VarL(5)=-10;VarU(5)=10;
% %aa6
% VarL(6)=-500;VarU(6)=500;
% %aa5
% VarL(7)=-2;VarU(7)=2;
% %aa6
% VarL(8)=-500;VarU(8)=500;

%%
    %making initial points

%change num of para+1
aa1=size(1,SwarmNum);
aa2=size(1,SwarmNum);
aa3=size(1,SwarmNum);
aa4=size(1,SwarmNum);
aa5=size(1,SwarmNum);
%aa6=size(1,SwarmNum);
%aa7=size(1,SwarmNum);
%aa8=size(1,SwarmNum);


for i=1:SwarmNum
%change num of para+1
aa1(1,i)=rand*(VarU(1)-VarL(1))+VarL(1);
aa2(1,i)=rand*(VarU(2)-VarL(2))+VarL(2);
aa3(1,i)=rand*(VarU(3)-VarL(3))+VarL(3);
aa4(1,i)=rand*(VarU(4)-VarL(4))+VarL(4);
aa5(1,i)=rand*(VarU(5)-VarL(5))+VarL(5);
% aa6(1,i)=rand*(VarU(6)-VarL(6))+VarL(6);
%aa7(1,i)=rand*(VarU(7)-VarL(7))+VarL(7);
%aa8(1,i)=rand*(VarU(8)-VarL(8))+VarL(8);


end



%%
    
    
    %%Calc ROP 1th Evaluate the constrains, conditions/Calculating the objF
fitness=size(1,SwarmNum);

%change num of para+1
n(1,1)=aa1(1,1);
n(2,1)=aa2(1,1);
n(3,1)=aa3(1,1);
n(4,1)=aa4(1,1);
n(5,1)=aa5(1,1);
%n(6,1)=aa6(1,1);
%n(7,1)=aa7(1,1);
%n(8,1)=aa8(1,1);



for i=1:SwarmNum

%change num of para+1
%fitness(i)=sam2(aa1(1,i),aa2(1,i),aa3(1,i),aa4(1,i),aa5(1,i),aa6(1,i),aa7(1,i),aa8(1,i));
%fitness(i)=sam2(aa1(1,i),aa2(1,i),aa3(1,i),aa4(1,i));
fitness(i)=sam2(aa1(1,i),aa2(1,i),aa3(1,i),aa4(1,i),aa5(1,i));

end

% y=randperm(SwarmNum);

%change num of para+1
inipoints(1,1:SwarmNum)=aa1(1,1:SwarmNum);
inipoints(2,1:SwarmNum)=aa2(1,1:SwarmNum);
inipoints(3,1:SwarmNum)=aa3(1,1:SwarmNum);
inipoints(4,1:SwarmNum)=aa4(1,1:SwarmNum);
inipoints(5,1:SwarmNum)=aa5(1,1:SwarmNum);
%inipoints(6,1:SwarmNum)=aa6(1,1:SwarmNum);
%inipoints(7,1:SwarmNum)=aa7(1,1:SwarmNum);
%inipoints(8,1:SwarmNum)=aa8(1,1:SwarmNum);


inipoints(6,1:SwarmNum)=fitness(1,1:SwarmNum);




for ami=1:iteration
Y=zeros(3,SwarmNum);

for i=1:SwarmNum

y1=round(rand*(SwarmNum-1)+1);
y2=round(rand*(SwarmNum-1)+1);
y3=round(rand*(SwarmNum-1)+1);

while y1==i 
y1=round(rand*(SwarmNum-1)+1);
end

while y2==i | y2==y1
y2=round(rand*(SwarmNum-1)+1);
end

while y3==i | y3==y1 | y3==y2 
y3=round(rand*(SwarmNum-1)+1);
end

Y(1,i)=y1;
Y(2,i)=y2;
Y(3,i)=y3;


end


WDV=size(3,SwarmNum);
for i=1:SwarmNum
%change num of para+1
WDV(1,i)=(inipoints(1,Y(1,i))-inipoints(1,Y(2,i)))*F;
WDV(2,i)=(inipoints(2,Y(1,i))-inipoints(2,Y(2,i)))*F;
WDV(3,i)=(inipoints(3,Y(1,i))-inipoints(3,Y(2,i)))*F;
WDV(4,i)=(inipoints(4,Y(1,i))-inipoints(4,Y(2,i)))*F;
WDV(5,i)=(inipoints(5,Y(1,i))-inipoints(5,Y(2,i)))*F;
%WDV(6,i)=(inipoints(6,Y(1,i))-inipoints(6,Y(2,i)))*F;
%WDV(7,i)=(inipoints(7,Y(1,i))-inipoints(7,Y(2,i)))*F;
%WDV(8,i)=(inipoints(8,Y(1,i))-inipoints(8,Y(2,i)))*F;


end


NRV=size(3,SwarmNum);
for i=1:SwarmNum
%change num of para+1
NRV(1,i)=(WDV(1,i)+inipoints(1,Y(3,i)));
NRV(2,i)=(WDV(2,i)+inipoints(2,Y(3,i)));
NRV(3,i)=(WDV(3,i)+inipoints(3,Y(3,i)));
NRV(4,i)=(WDV(4,i)+inipoints(4,Y(3,i)));
NRV(5,i)=(WDV(5,i)+inipoints(5,Y(3,i)));
%NRV(6,i)=(WDV(6,i)+inipoints(6,Y(3,i)));
%NRV(7,i)=(WDV(7,i)+inipoints(7,Y(3,i)));
%NRV(8,i)=(WDV(8,i)+inipoints(8,Y(3,i)));



end


TV=size(NumOfVar,SwarmNum);

for j=1:SwarmNum
for i=1:NumOfVar
a=rand;

if a<CR
TV(i,j)=NRV(i,j);
else
    TV(i,j)=inipoints(i,j);

end

end
end
%%
    %Filter TV by taking the upper and lowwer boundries into account
%change num of para+1
for i=1:SwarmNum

if TV(1,i)<VarL(1)

TV(1,i)=VarL(1);
end

if TV(1,i)>VarU(1)
TV(1,i)=VarU(1);
end

end

for i=1:SwarmNum

if TV(2,i)<VarL(2)
TV(2,i)=VarL(2);
elseif TV(2,i)>VarU(2)
TV(2,i)=VarU(2);
end

end  

for i=1:SwarmNum

if TV(3,i)<VarL(3)
TV(3,i)=VarL(3);
elseif TV(3,i)>VarU(3)
TV(3,i)=VarU(3);
end

end  

for i=1:SwarmNum

if TV(4,i)<VarL(4)
TV(4,i)=VarL(4);
elseif TV(4,i)>VarU(4)
TV(4,i)=VarU(4);
end

end  

for i=1:SwarmNum

if TV(5,i)<VarL(5)
TV(5,i)=VarL(5);
elseif TV(5,i)>VarU(5)
TV(5,i)=VarU(5);
end

end  
% 
% 
% for i=1:SwarmNum
%     
%     if TV(6,i)<VarL(6)
%         TV(6,i)=VarL(6);
%     elseif TV(6,i)>VarU(6)
%         TV(6,i)=VarU(6);
%     end
%     
% end  
% 
% for i=1:SwarmNum
%     
%     if TV(7,i)<VarL(7)
%         TV(7,i)=VarL(7);
%     elseif TV(7,i)>VarU(7)
%         TV(7,i)=VarU(7);
%     end
%     
% end  
% 
% for i=1:SwarmNum
%     
%     if TV(8,i)<VarL(8)
%         TV(8,i)=VarL(8);
%     elseif TV(8,i)>VarU(8)
%         TV(8,i)=VarU(8);
%     end
%     
% end  













%%
    %calc ROP 2th
for i=1:SwarmNum
%change num of para+1

%TV(9,i)=sam2(TV(1,i),TV(2,i),TV(3,i),TV(4,i),TV(5,i),TV(6,i),TV(7,i),TV(8,i));
%TV(5,i)=sam2(TV(1,i),TV(2,i),TV(3,i),TV(4,i));
TV(6,i)=sam2(TV(1,i),TV(2,i),TV(3,i),TV(4,i),TV(5,i));
end
%%
    %replace if TV is better than inipoints

for i=1:SwarmNum
%change num of para+1
if TV(6,i)<inipoints(6,i)
inipoints(1:6,i)=TV(1:6,i);
end

end
%%
    %best global
%change num of para+1
subplot(3,4,1);
plot(inipoints(1,:))
xlabel ('Swarm Num')
ylabel ('a1')
subplot(3,4,2);
plot(inipoints(2,:))
xlabel ('Swarm Num')
ylabel ('a2')
subplot(3,4,3);
plot(inipoints(3,:))
xlabel ('Swarm Num')
ylabel ('a3')
subplot(3,4,4);
plot(inipoints(4,:))
xlabel ('Swarm Num')
ylabel ('a4')
subplot(3,4,5);
plot(inipoints(5,:))
xlabel ('Swarm Num')
ylabel ('a5')

% subplot(3,4,6);
% plot(inipoints(6,:))
% xlabel ('Swarm Num')
% ylabel ('a6')
% subplot(3,4,7);
% plot(inipoints(7,:))
% xlabel ('Swarm Num')
% ylabel ('a7')
% subplot(3,4,8);
% plot(inipoints(8,:))
% xlabel ('Swarm Num')
% ylabel ('a8')



%change num of para+1
BG(ami,1)=min(inipoints(6,1:SwarmNum));
subplot(3,4,6);
plot(BG)
xlabel ('Iteration num')
ylabel ('fittness=MSE')
pause(0.00001)




for j=1:SwarmNum


%change num of para+1
if inipoints(6,j)==BG(ami,1)

s=0;
%change to number of data points see matrix data row number
for i=1:21

%            data(i,5)=(inipoints(1,j)*(data(i,1)^inipoints(2,j)))+...
%           (inipoints(3,j)*(data(i,2)^inipoints(4,j))*(data(i,3)^inipoints(5,j)))+...
%           (inipoints(6,j)*(data(i,3)^inipoints(7,j))+inipoints(8,j));
% add one to data column to write the estimated OF output data
% had 3 column add one so 4! and write use column to calc the
% 4th column values-see the asm2 function these two shold be
% same!
    %Ex
%data(i,3)=(inipoints(1,j)+inipoints(2,j)/((data(i,1)^inipoints(3,j))+inipoints(4,j)));    
%o=(t1+t2/((data(i,1)^t3)+t4)-data(i,2))^2+o;

%data(i,4)=inipoints(1,j)+inipoints(2,j)*(data(i,1)^inipoints(3,j))+inipoints(4,j)*(data(i,2)^inipoints(5,j)); 
%o=t1+t2*(data(i,1)^t3)+t4*(data(i,2)^t5)+o;

data(i,4)=(inipoints(1,j)+inipoints(2,j)/(inipoints(3,j)*data(i,1)^(inipoints(4,j)*data(i,2)^inipoints(5,j))));
%(t1+t2/(t3*data(i,1)^(t4*data(i,2)^t5)))




end

j=SwarmNum;
% num of para and replace it in Bset rows
Bset(1:5,1)=inipoints(1:5,j);

end


end





%number of plots =num of paramters + best + 
    subplot(3,4,7);
%replace num of data column and data output vs model out put =two last
%columns
plot(1:21,data(:,3))
hold on
plot(1:21,data(:,4))
hold off

xlabel ('data points')
ylabel ('how close it is?')

end


Bset
BG(iteration,1)





















