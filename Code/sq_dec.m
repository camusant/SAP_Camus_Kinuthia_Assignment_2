function outq = sq_dec(idx, n_bits, xmax, m)
% Uniform Scalar Quantizer Decoder
% Inputs:   idx, Index used for the quantization
%           n_bits, number of bits avalaible to quantize one sample
%           xmax and m define the range of the quantizer [m-xmax ; m+xmax]
% Output:   outq, reconstruction of idx
L = 2^n_bits;
% Quantization interval
delta = 2*xmax/L;
% codebook = m-xmax:delta: m+xmax;
outq = (idx-1).*delta + (delta/2) + (-xmax+m);
end