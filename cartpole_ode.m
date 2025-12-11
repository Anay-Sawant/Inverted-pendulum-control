function xdot = cartpole_ode(~, x, u, M, m, l, g)


X      = x(1);
Xdot   = x(2);
theta  = x(3);
thetad = x(4);

% prevent extreme values (optional safety)
% theta = wrapToPi(theta);

% intermediate
S = sin(theta);
C = cos(theta);
den = M + m;

% theta_ddot (from the standard compact form)
num_theta = g*S + C * ( - (u + m*l*thetad^2*S) / den ) ;
den_theta = l * (4/3 - (m * C^2) / den);
thetadd = num_theta / den_theta;

% X_ddot
Xdd = (u + m*l*(thetad^2*S - thetadd*C)) / den;

xdot = [ Xdot; Xdd; thetad; thetadd ];
end
