function H = S(target, scale_target, size_hologram, pixel_hologram, lambda, f)  
    %% Get spots position from  the target
    s = spots(target);     % Traps positions
    M = size(s,1);         % Number of traps    
    wt = size(target,2);   % Width in pixels
    ht = size(target,1);   % Height in pixels
    wh = size_hologram(2); % Width in pixels
    hh = size_hologram(1); % Height in pixels

    %% Compute Planes
    u = (((1:wh)-(wh-1)/2)-1)*pixel_hologram(2); 
    v = (((1:hh)-(hh-1)/2)-1)*pixel_hologram(1);

    U  = repmat(u, hh,1)  *2*pi/lambda/f; % Horizontal gratings (shift x)
    V  = repmat(v, wh,1)' *2*pi/lambda/f; % Vertical gratings   (shift y)

    U2 = repmat(u.^2, hh,1);
    V2 = repmat(v.^2, wh,1)';
    UV = (U2+V2)*pi/lambda/(f^2); % Quadratic gratigs (lens effect)

    x = s(:,1)*scale_target(2)/wt; 
    y = s(:,2)*scale_target(1)/ht;
    z = s(:,3);
    
    %% Backward propagation and superposition of all traps
    H = zeros(hh,wh);    
    for m=1:M    
        H = H + exp(1i*(x(m)*U + y(m)*V + z(m)*UV));    
    end         
return   


