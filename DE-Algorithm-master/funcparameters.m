function o = funcparameters(t1,t2,t3,t4,t5)
%change above paramters that u look for

load matlab
o=0;

%change i to number of data rows
for i=1:21
   
    %write the form of your equation and cal error ^2 and use the same at sman file line 370
    %insde if
    %o=((t1+t2/(t3*data(i,1)+(t4*data(i,2)^t5)))-data(i,3))^2+o;
    o=(((t1*data(i,2))*(data(i,1)^(t2*data(i,2)+t3))+(t4*data(i,2)+t5))-data(i,3))^2+o;
    
end

end