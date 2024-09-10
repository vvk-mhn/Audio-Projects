function [tfr,t,f] = tfrwv_fb(x,t,N,trace)
%TFRWV_FB   Wigner-Ville time-frequency distribution using Fourier-Bessel coefficients.
%   X     : signal if auto-WV, or [X1,X2] if cross-WV.
%   T     : time instant(s)          (default : 1:length(X)).
%   N     : number of frequency bins (default : length(X)).
%   TRACE : if nonzero, the progression of the algorithm is shown
%           (default : 0).
%   TFR   : time-frequency representation.
%   F     : vector of normalized frequencies.
%   Example :
%   sig=fmlin(128,0.1,0.4); tfrwv_fb(sig);

if nargin < 4
    trace = 0;
end

[xrow, ~] = size(x);
if nargin < 3
    N = xrow;
end

if N < 0
    error('N must be greater than zero');
end

if nargin < 2
    t = 1:xrow;
end

[trow, tcol] = size(t);
if trow ~= 1
    error('T must only have one row'); 
end

tfr = zeros(N, tcol);  

if trace
    disp('Wigner-Ville distribution');
end

for icol = 1:tcol
    ti = t(icol);
    taumax = min([ti-1, xrow-ti, round(N/2)-1]);
    tau = -taumax:taumax;
    indices = rem(N + tau, N) + 1;
    
    for m1 = 1:N
        g = (2 * pi * (0:N-1)) / N;
        F1_r = fb1(x(:, 1)', tau, N);  % Compute Fourier-Bessel coefficients
        
        % WVD computed using FB1 coefficients
        tfr(indices, icol) = F1_r .* exp(1i * g(m1) * (ti + tau)) .* conj(F1_r);
    end
    
    if trace
        disprog(icol, tcol, 10);
    end
end

if nargout <= 1
    tfrqview(tfr, x, t, 'tfrwv_fb');
elseif nargout == 3
    f = (0.5 * (0:N-1) / N)';
end
end

function a3 = fb1(s, tau, N)
%   y = 4.*cos((2*pi/8*n).*n/256) + 4.*cos(((2*pi.*(512-n)./8)+40).*n/256);
MM = length(s); % Order of FB expansion
% Computation of roots of Bessel function Jo(x)
x = 2;
alfa = zeros(1, MM);
for i = 1:MM
    ex = 1;
    while abs(ex) > 0.00001
        ex = -besselj(0, x) / besselj(1, x);
        x = x - ex;
    end
    alfa(i) = x;
    x = x + pi;
end

nb = 1:N;

a = N;
a3 = zeros(1, MM);

for m1 = 1:MM
    a3(m1) = (2 / (a^2 * (besselj(1, alfa(m1)))^2)) * sum(nb .* s' .* besselj(0, alfa(m1) / a * nb)) * exp(-1i * alfa(m1) * tau);
end
end