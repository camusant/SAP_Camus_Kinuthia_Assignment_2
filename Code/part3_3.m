% Part 3-3 Quantizing the LP parameters
% Camus-Kinuthia
% 03/03/2020 16:57

clear all; close all; clc;
load('assignment2.mat');

[Es8, Vs8, As8, Ps8] = analysis(speech8, 256, 1, 10);

%Quantizing the LP parameters
codeA8 = encodefilter (As8,lsfCB1,lsfCB2);
As8q = decodefilter(codeA8, lsfCB1,lsfCB2);

speechR = synthesis(Es8, Vs8, As8q, Ps8, 1);
