function [frequencies, amplitudes] = FourierTransform(f1, N, fs)
    % % % provides amplitude spectrum calculated using FFT
    % nfft = 2^nextpow2(2*N-1);
    nfft = N;
    fourier_f1 = abs(fft(f1,nfft)/nfft);
    % fourier_f1 = abs(fft(f1)) / N;
    amplitudes = fourier_f1(1:floor(nfft/2)+1);
    amplitudes(2:end-1) = 2*amplitudes(2:end-1);
    % frequencies = fs/N * (0:N/2);
    frequencies = fs*(0:floor(nfft/2))/nfft;
end
