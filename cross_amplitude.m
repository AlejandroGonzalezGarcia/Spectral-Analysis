function [frequencies, power] = cross_amplitude(x,y,N,fs)
    % outputs two-sided complex amplitude spectra
    frequencies = fs/N * (0:N/2);
    xdft1 = fft(x);  
    ydft1 = fft(y);
    Sxy1a=xdft1.*conj(ydft1);   
    Sxy1b=abs(Sxy1a)./N;
    Sxy1c=Sxy1b(1:N/2+1);
    Sxy1c(2:end-1)=2*Sxy1c(2:end-1);
    power = Sxy1c;
end