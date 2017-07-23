function W = initialize(M_in,M_out)

%Initializing the parameters so that symmetry breaks

W = zeros(M_out,M_in+1);

ep_in = 0.12;

W = rand(M_out,M_in+1) * 2 * ep_in - ep_in;

end