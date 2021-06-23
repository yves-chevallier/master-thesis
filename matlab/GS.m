function H = GS(Target, lambda, f, w, h, sx, sy)   
    s = spots(Target);
    ns = size(s,1);    
    
    if ns > 30
        ns = 30;
    end
    
    H = exp(1i*rand(h,w)*2*pi); % Initial Random phase
    for i = 1:ns
        B = exp(1i*angle(H));
        C = fftshift(fft2(ifftshift(B)));
        D = abs(Target) .* exp(1i*angle(C));
        H = fftshift(ifft2(ifftshift(D))); 
        
    end
return   