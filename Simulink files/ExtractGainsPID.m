function [Kp, Kd, Ki, a] = ExtractGainsPID(tf)
    [num den] = tfdata(tf, 'v');
    alpha = num(1);
    beta = num(2);
    gamma = num(3);
    delta = den(2);
    
    Kp = (-gamma + beta*delta)/delta^2;
    Ki = gamma/delta;
    Kd = (gamma-beta*delta + alpha*delta^2)/delta^3;
    a = delta;
end