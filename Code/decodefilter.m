function Aq = decodefilter(codeA,cb1,cb2)
% This function is a multistage VQ coding for the LP components of the
% matrix A in LSF components. cb1 and cb2 are two codebooks of
% 10-dimensional LSF vectors. cb1 corresponds to a 10 bit VQ optimized on
% 10 dimensional LSF vectors. cb2 corresponds to a 10 bit second stage
% residual codebook.
% 
% The output Aq is the matrix of filter coefficients stored row-wise.

szcodA = size(codeA);
szcb1 = size(cb1);
Aq =zeros(szcodA(1), szcb1(2)+1);
for i=1: szcodA(1)
   lsf1 =  cb1(codeA(i,1),:);
   lsf2 =  cb2(codeA(i,2),:);
   lsfquant = lsf1+lsf2;
   lsfquant = sort(lsfquant);
   Aq(i,:) = lsf2poly(lsfquant);
end
end