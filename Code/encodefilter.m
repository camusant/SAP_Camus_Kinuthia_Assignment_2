function codeA = encodefilter (A,cb1,cb2)
% This function is a multistage VQ coding for the LP components of the 
% matrix A in LSF components. cb1 and cb2 are two codebooks of 
% 10-dimensional LSF vectors. cb1 corresponds to a 10 bit VQ optimized on 
% 10 dimensional LSF vectors. cb2 corresponds to a 10 bit second stage 
% residual codebook.
% 
% The output codeA is a twocolumn matrix with the corresponding code 
% indices, stored row-wise.
szcoef = size(A);
szcb1 = size(cb1);
codeA = zeros(szcoef(1),2);

for i=1 : szcoef(1)
    dmin=100;
    indice1 =0;
    lsfA = poly2lsf(A(i,:))';
    %first pass
    for j =1: szcb1(1)
       dif = lsfA- cb1(j,:);
       d = (1/szcb1(2))*dif*(dif');
       if dmin >d
           dmin=d;
           indice1 = j;
       end       
    end 
    codeA(i,1) = indice1;
    quant1 = cb1(indice1,:);
%     test=0;
%   second pass (residual)
    res = lsfA - quant1;
    dmin=100;
    indice2 =0;
    for j =1: szcb1(1)
        dif = res - cb2(j,:);
        d = (1/szcb1(2))*dif*(dif');
        if dmin >d
            dmin=d;
            indice2 = j;
        end
    end
    codeA(i,2) = indice2;
end
end