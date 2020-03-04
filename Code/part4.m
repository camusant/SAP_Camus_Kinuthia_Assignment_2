% Part 4
% Camus Kinuthia 04/03/2020
% Goal : Max SNR with the factor k

clear all; close all; clc;
load("assignment2.mat");
x =speech8;
svX = sqrt(var(x));

k3 =  3.6; %parameter to choose for R =3

%% Question 1 find the optimal k for the rate R =3 bits and m=0
xmax = svX *k3;
indX = sq_enc(x, 3, xmax, 0);
xq = sq_dec(indX, 3, xmax, 0, 0);
error =x-xq;
ver = var(error);
SNR = 10*log10(var(x)/ver);
% 1st pass 
% k3         SNR(dB)
% 0          0
% 1          3.0864
% 2          5.4579
% 3          6.8284
% 4          6.8071
% 5          5.8099
%2nd pass
% 2         5.4576
% 2.5       6.3034
% 3         6.8284
% 3.5       6.9802
% 4         6.8071
% 4.5       6.3911
% 5         5.8099
%3rd pass
% 3         6.8284
% 3.25      6.9511
% 3.5       6.9802
% 3.75      6.9280
% 4         6.8071
%4th pass
% 3.25      6.9511
% 3.3       6.9640
% 3.35      6.9733
% 3.4       6.9791
% 3.45      6.9812
% 3.5       6.9802
% 3.55      6.9758
% 3.6       6.9683
% 3.75      6.9280

%Conclusion kopt = 3.45 for R=3
%% Questions 2, 3 and 6 Plot the optimal SNR and 
% the theorical SNR (xmax = max(x)) vs the rate
R =(1:16);
R2 =(1:7); %low-rates with midtread quantizers
vkopt = [0.95, 2.1, 3.45, 4.95, 6.3, 7.65, 8.65, 9.95, 10.6, 11.0, 11.1, 11.2, 11.15, 11.2, 11.15, 11.15];
lr = length(R);
lr2 = length(R2);
vsnr = zeros(1, lr);
vsnr2  = zeros(1, lr2);
tsnr = zeros(1,lr); % Theorical snr
for i =1:lr
    xmax1 = svX *vkopt(i);
    xmax2 = max(x); %Theorical
    indX1 = sq_enc(x, R(i), xmax1, 0);
    xq1 = sq_dec(indX1, R(i), xmax1, 0, 0);
    error1 =x-xq1;
    ver1 = var(error1);
    vsnr(i) = 10*log10(var(x)/ver1);
    %Theorical calculations
    indX2 = sq_enc(x, R(i), xmax2, 0);
    xq2 = sq_dec(indX2, R(i), xmax2, 0, 0);
    error2 =x-xq2;
    ver2 = var(error2);
    tsnr(i) = 10*log10(var(x)/ver2);
    if i ==1
        errsave1_1 = error1;
        errsave1_2 = error2;
    elseif i ==3
        xq3_1 = xq1;
    elseif i ==12
        errsave12_1 = error1;
        errsave12_2 = error2;
    end
end
% Midtread m = delta/2 = xmax/2
for i =1:lr2
    xmax1 = svX *vkopt(i);
    indX1 = sq_enc(x, R2(i), xmax1, xmax1/(2^R2(i)) );
    xq1 = sq_dec(indX1, R2(i), xmax1, xmax1/(2^R2(i)), 0);
    error1 =x-xq1;
    ver1 = var(error1);
    vsnr2(i) = 10*log10(var(x)/ver1);
    if i ==3
        xq3_2 = xq1;
    end
end


figure(1);
plot(R, vsnr);
hold on
plot(R, tsnr);
plot(R2, vsnr2);
legend('optimized SNR', 'Theorical SNR', 'Midtread low rate');
hold off

%Q4 Not a difference btw optimized and theorical SNR  for R >= 9 bits
%Q5 The quantization has a part of the pitch plunged in the white noise at
%R=1 bit. At R= 12 bits, white noise only
title ("SNR(dB) vs Rate (bits)");
xlabel('Rate (bits)');
ylabel('SNR(dB)');
%Q6 With a midtread quantizer, higher SNR at low rates, because we remove
%the white noise of the quantization.
