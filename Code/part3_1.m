% Part 3-1 Quantizing the gain
% Camus-Kinuthia
% 01/03/2020 18:13

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
% % Goal : find the n of bits when we can hear the sound
idEs = sq_enc(Es8,6, 1549-1.156,1.156);
EsEst = sq_dec(idEs, 6, 1549-1.156, 1.156);

speechR = synthesis(EsEst, Vs8, As8, Ps8, 1); %ANS : n= 7 bits
