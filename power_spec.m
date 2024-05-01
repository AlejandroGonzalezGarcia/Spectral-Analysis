function [frequencies, power] = power_spec(f1, N, fs)
    % provides power spectrum for series f1
    nfft = 2^nextpow2(2*N-1);
    fourier_f1 = abs(fft(f1,nfft));
    fourier_f1= fourier_f1(1:nfft/2+1);
    power = abs(fourier_f1).^2 / nfft;
    power(2:end-1) = 2*power(2:end-1);
    frequencies = fs/nfft * (0:nfft/2);
end

