% Part 3-1 Quantizing the gain
% Camus-Kinuthia
% 02/03/2020 22:31

clear all; close all; clc;
load('assignment2.mat');

%% 1) Histogram of the prediction energy error

% Use analysis2 for the test signal speech 8

[Es8, Vs8, As8, Ps8] = analysis(speech8, 256, 1, 20);

% Histogram
Eselem = unique(Es8);
counts = hist(Es8, Eselem);


figure(2)
stem(Eselem, counts)
title('Histogram of the prediction error energy')
xlabel('Prediction error energy')
ylabel('Counts')

%Valmin = 1.156
%Vmax = 1549
% Parameters to choose m = 1.156, xmax=1549-m

%% 2 Quantification
%  Goal : find the n of bits when we can hear the sound
idEs = sq_enc(Es8,7, 1549-1.156,1.156);
EsEst = sq_dec(idEs, 7, 1549-1.156, 1.156,0);

speechR = synthesis(EsEst, Vs8, As8, Ps8, 1); %ANS : n= 7 bits

%% 3 Analyse and code the log gain (prediction energy error)
logEs = log10(Es8);
elemLog = unique(logEs);
countslog = hist(logEs,elemLog);

figure(3)
stem(elemLog, countslog)
title('Histogram of the logatithmic prediction error energy')
xlabel('Log10 of the prediction error energy')
ylabel('Counts')

%Valmin = 0.06296
%Vmax = 3.19
% Parameters to choose m = 0.06296, xmax=3.19-m

%% 4 Quantification
%  Goal : find the n of bits when we can hear the sound with a logarithmic
%  energy
idlogEs = sq_enc(logEs, 3, 3.19-0.06296, 0.06296);
EsEstLog = sq_dec(idlogEs, 3, 3.19-0.06296, 0.06296, 1);

speechRLog = synthesis(EsEstLog, Vs8, As8, Ps8, 1); %ANS : n=5 bits


% Conclusion Q5: the log compression is better for the gain.