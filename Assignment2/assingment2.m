load assignment2.mat

%idx = sq enc(in, n bits, xmax, m)
in = [1:10];
n_bits = 4;
xmax = 10;
m = 0; % --> [-10 ,..., 0, ..., 10]

delta = 2*xmax/(2^n_bits);
delta = 1
qspace = [m-xmax: delta: m+xmax];
in_mod = in - mean(in);
idx = zeros(1,length(in))
for i=1:length(in_mod)
    for j=1:length(qspace)
        if in_mod(i) <= qspace(j)
            idx(i) = qspace(j);
            break;
        end
    end
end

idx
