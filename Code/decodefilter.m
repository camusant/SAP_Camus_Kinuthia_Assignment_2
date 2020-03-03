function Aq = decodefilter(codeA,cb1,cb2)
% This function is a multistage VQ coding for the LP components of the
% matrix A in LSF components. cb1 and cb2 are two codebooks of
% 10-dimensional LSF vectors. cb1 corresponds to a 10 bit VQ optimized on
% 10 dimensional LSF vectors. cb2 corresponds to a 10 bit second stage
% residual codebook.
% 
% The output Aq is the matrix of filter coefficients stored row-wise.
end