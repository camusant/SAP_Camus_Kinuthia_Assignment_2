% Part 3-2 Quantizing the Voiced/Unvoiced  and the pitch
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

lengthShannon1 = binLrl(runLength8);
ltabL = length (unique(runLength8));

% Compression rate = binary source stream / length in bits of the binary
% code stream
CR = length(Vs8)/lengthShannon1;

% CR = 153.09. It can be a good algorithm.
% But this encoding then decoding can be long and can vary in function of
% the length of the speech signal and of its application. => delay
% Conclusion : The sequence of 0s and 1s without modifying nothing stays a
% good solution for the moment.
% To encode the pitch period, we know that the pitch period is in samples. 
% So we take the upper power of 2 compared to the maxixmum of the pitch 
% period. The power of 2 gives the number of bits. So 9 bits for a frame
% for the period each time.