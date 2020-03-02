function [runLength, start] = binstr2rl(str)
%   binstr2rl replaces a string str a or a char of 0s and 1s by run-length values.
%   start is the first bit(0 or 1).
%   runLength is the run-length values vector
if isstring(str)
   str = char(str); 
end
L = length(str);
start = str(1);
token_char = str(1);
nb_switch =0;
%Detection of switchs (size of run length vector)
for i=2:L
    if str(i)~= token_char
       nb_switch = nb_switch+1;
       token_char = str(i);
    end    
end
runLength = zeros(nb_switch+1,1);
lRL = length(runLength);
%We complete the run-length vector.
j=1;
token_char = str(1);
l=1;
for i=2:L
    if str(i)== token_char 
       l=l+1;
       if i==L
          runLength(j) = l;
          j=j+1;
       end
    else 
       runLength(j) = l;
       token_char = str(i);
       l=1;
       j =j+1;
       if i==L
          runLength(j) = l;
          j=j+1;
       end
    end
end
end