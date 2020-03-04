% Part 3-4 Synthesis of the quantizer
% Camus Kinuthia 04/03/2020 00:20

clear all; close all; clc;
load('assignment2.mat');


[Es8, Vs8, As8, Ps8] = analysis(speech8, 256, 1, 10);

%% Quantization

% Of the gain on 5 bits/frame
logEs = log10(Es8);
idlogEs = sq_enc(logEs, 7, 3.19-0.06296, 0.06296);
EsEstLog = sq_dec(idlogEs, 7, 3.19-0.06296, 0.06296, 1);

% For the pitch period and the V/U bool we do not need to do some
% quantization. (9 bits/frame for the pitch period and 1 bit/frame for the
% U/V bool)

% Of the LP parameters (20 bits/frame)
codeA8 = encodefilter (As8,lsfCB1,lsfCB2);
As8q = decodefilter(codeA8, lsfCB1,lsfCB2);

speechR = synthesis(EsEstLog, Vs8, As8q, Ps8, 1);

%Calculation of the SNR 

sX = speech8(1:length(speechR));
q = sX - speechR;
VsX = var(sX);
Vq = var(q);
snr = 10*log10(VsX/Vq)   %-1.4762 dB for 5 bits on the gain
                         %-1.-1.5069 dB for 7 bits on the gain

% 1) This SNR is negative because of the quality of the LP encoding and
% decoding, decreases the order and increases the error.
%
% 2) Allocation of bits based on the previous parts. 
% 5 bits for the gain 
% 9 bits for the pitch
% 1 bit for the U/V bool
% 20 bits on the LP estimators

% 3) bit rate of 35 bits per sample => Fs*35 = 8000*35 bits/sec =
% 280 kits/sec
% 4) It does not make sense to evaluate the SNR here because of the effect 
% of the LP coefficients VQ on 10 dimension. We need more dimensions for 
% this operation to enhanced our result. Need more calculations.
%