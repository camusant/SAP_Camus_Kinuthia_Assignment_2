function outq = sq_dec(idx, n_bits, xmax, m, indiceLog)
% Uniform Scalar Quantizer Decoder
% Inputs:   idx, Index used for the quantization
%           n_bits, number of bits avalaible to quantize one sample
%           xmax and m define the range of the quantizer [m-xmax ; m+xmax]
%           indiceLog (bool) indicate if our variable is in a log10 scale.
% Output:   outq, reconstruction of idx
L = 2^n_bits;
% Quantization interval
delta = 2*xmax/L;
% codebook = m-xmax:delta: m+xmax;
outq = (idx-1).*delta + (delta/2) + (-xmax+m);
if indiceLog ==1
    outq = 10.^outq;
end
end