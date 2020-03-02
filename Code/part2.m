% Test script part 2 -Uniform Quantizer
clear all;close all; clc;
x = -6:0.01:6;
xmax = 4;
n_bits = 2;
%% Case 1 : m=0

m1 = 0;
id1 = sq_enc(x, n_bits, xmax, m1);
xes1 = sq_dec(id1, n_bits, xmax, m1,0);

%% Case 2 : m=1.5

m2=1.5;
id2 = sq_enc(x, n_bits, xmax, m2);
xes2 = sq_dec(id2, n_bits, xmax, m2,0);

figure(1)
plot(x,x)
hold on
plot(x, xes1)
legend('Original signal', 'm=0')
hold off
grid on
title('Uniform Scalar Quantizer, xmax=4, n_{bits}=2, m=0')


figure(2)
plot(x,x)
hold on
plot(x, xes2)
legend('Original signal', 'm=1.5')
hold off
grid on
title('Uniform Scalar Quantizer, xmax=4, n_{bits}=2, m=1.5')
