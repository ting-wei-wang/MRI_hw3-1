% sec
T1g = 0.6;
T1w = 0.4;
T2g = 0.11;
T2w = 0.09;
%--(a)-------------------------------------------
v_1 = 1 - exp(-(2/T1g)); % TR = 2000
v_2 = 1 - exp(-(2/T1w)); % TR = 2000
k = 0:0.01:0.2;
m = 1:21;

A = v_1 * exp(-k/T2g) ;
B = v_2 * exp(-k/T2w);
figure;
plot(k,A); hold on
plot(k,B); hold on
title('T2 TE relationship');xlabel('TE(sec)');ylabel('強度');
d = zeros(1,21);
d(m) = A(m)-B(m);
p = max(d); %**sec
%--draw y-axis--------------------------------
p_time = zeros(1,21);
r = 1:21;
p_time(r) = 0.11; % min
strong_te = 0:0.05:1;
plot(p_time,strong_te);
legend('T2 gray','T2 white','max contrast')
%----(b)--------------------------------------
c = zeros(1,21);
x_1 = v_1 * exp(-0.02/T2g); % TE = 20
x_2 = v_2 * exp(-0.02/T2w); % TE = 20
i = 0:0.1:2;
j = 1:21;
a = (x_1+1) - exp(-(i/T1g)); 
b = (x_2+1) - exp(-(i/T1w));
figure;
plot(i,a); hold on
plot(i,b); hold on;
title('T1 TR relationship ');xlabel('TR(sec)');ylabel('強度');
c(j) = b(j)-a(j);
n = max(c); %0.5sec
%--draw y-axis--------------------------------
p_time2 = zeros(1,21);
p_time2(r) = 0.5; % min
strong_tr = 0.6:1.4/20:2;
plot(p_time2,strong_tr);
legend('T1 gray','T1 white','max contrast')