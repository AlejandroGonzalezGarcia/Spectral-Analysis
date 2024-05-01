function [frequencies, power] = cross_power(x,y,fs)
    % % % provides cross-power spectrum between series x and series y
    if length(x) > length(y)
        N  = length(x);
    else
        N = length(y);
    end
    % frequencies = fs/N * (0:N/2);
    nfft = 2^nextpow2(2*N-1);
    frequencies = fs/nfft * (0:nfft/2);
    xdft1 = fft(x,nfft);  %<outputs two-sided complex amplitude spectra
    ydft1 = fft(y,nfft);
    Sxy1a=xdft1.*conj(ydft1);   
    Sxy1b=abs(Sxy1a)./nfft;
    Sxy1c=Sxy1b(1:floor(nfft/2)+1);
    Sxy1c(2:end-1)=2*Sxy1c(2:end-1);
    power = Sxy1c;
end