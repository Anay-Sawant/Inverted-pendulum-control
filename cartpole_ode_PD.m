function xdot = cartpole_ode_PD(~, x, M, m, l, g, Kp, Kd, Kpx, Kdx)

 X      = x(1);
    Xdot   = x(2);
    theta  = x(3);
    thetad = x(4);

    % fix: dynamics treat theta=0 as downward, so upright = pi
theta_error = wrapToPi(theta - pi);   % keeps error in (-pi,pi]

% Inner loop: PD on angle error (stabilize theta -> pi)
u_theta = -Kp * theta_error - Kd * thetad;


  % Outer loop: PD on cart position
  u_x = -Kpx * X - Kdx * Xdot;

  % Total control input
    u = u_theta + u_x;

    % Saturation (prevents explosion)
    umax = 50;
    u = max(min(u, umax), -umax);

    % Call original dynamics
    xdot = cartpole_ode([], x, u, M, m, l, g);
end
