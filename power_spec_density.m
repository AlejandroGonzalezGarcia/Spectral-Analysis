function [frequencies, psdf] = power_spec_density(f1, N, fs)
    % provides power spectral density by dividing by sampling frequency
    % can be converted in dB/Hz by multiplying by 10log(psdf)
    nfft = 2^nextpow2(2*N-1);
    fourier_f1 = abs(fft(f1,nfft));
    fourier_f1= fourier_f1(1:nfft/2+1);
    psdf = abs(fourier_f1).^2 / (fs*nfft);
    psdf(2:end-1) = 2*psdf(2:end-1);
    frequencies = fs/nfft * (0:nfft/2);
end
