function idx = sq_enc(in, n_bits, xmax, m)
    % Uniform Scalar Quantizer Coder
    % Inputs:   in, Signal in input
    %           n_bits, number of bits avalaible to quantize one sample
    %           xmax and m define the range of the quantizer [m-xmax ; m+xmax]
    % Output:   idx, index of the chosen quantization level
    L = 2^n_bits;
    % Quantization interval
    delta = 2*xmax/L;
    % codebook = m-xmax:delta: m+xmax;
    idx = floor((in - (-xmax+m))./delta) +1;
    idx(idx<=0) =1;   %x < -xmax 
    idx(idx > L) = L;   %x> xmax
end