% Part 3-2 Quantizing the Voiced/Unvoiced pitch
% Camus-Kinuthia
% 02/03/2020 22:31

% Idea : quantize the V/U pitch with the running length coding to compress
% the stream of 0's and 1's.
% For each of 0s and 1s we mark it's length.

clear all; close all; clc;
load('assignment2.mat');

[Es8, Vs8, As8, Ps8] = analysis(speech8, 256, 1, 20);

%Converting in Rl coding
[runLength8, bitstart] = binstr2rl(Vs8);