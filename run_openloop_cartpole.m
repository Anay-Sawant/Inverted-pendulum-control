% Parameters (starter values)
M = 1.0;      % cart mass (kg)
m = 0.1;      % pendulum mass (kg)
l = 0.5;      % pendulum length to COM (m)
g = 9.81;     % gravity (m/s^2)
%b_x = 0.03;    % friction damping for cart
%b_theta = 0.03; % air damping of pendulum
% initial condition: small angle perturbation
x0 = [0; 0; 0.1; 0];   % [X; Xdot; theta(rad); thetadot]

tspan = [0 10];

Kp = 150;
Kd = 25;
Kpx = 1.5;
Kdx = 1;

% ode45 call (wrap the additional args)
[t, x] = ode45(@(t,x) cartpole_ode_PD(t,x,M,m,l,g,Kp, Kd, Kpx, Kdx), tspan, x0);

% plots
figure;
subplot(2,1,1)
plot(t, x(:,3)); grid on
xlabel('Time (s)'); ylabel('\theta (rad)');
title('PD-loop: pendulum angle (falls over)');

subplot(2,1,2)
plot(t, x(:,1)); grid on
xlabel('Time (s)'); ylabel('Cart position X (m)');
title('Open-loop: cart position');

figure;
for k = 1:4:length(t)
    X = x(k,1);
    theta = x(k,3);
    % cart rectangle
    clf;
    hold on; axis equal;
    plot([-1.5 1.5], [0 0], 'k:'); % ground line
    rectangle('Position',[X-0.15 -0.05 0.3 0.1],'FaceColor',[0.6 0.6 0.6]);
    % pendulum
    px = X + l*sin(theta);
    py = 0 + l*cos(theta);
    plot([X px],[0 py],'r-','LineWidth',3);
    plot(px,py,'ro','MarkerSize',6,'MarkerFaceColor','r');
    xlim([X-1 X+1]); ylim([-1 1.2]);
    title(sprintf('t = %.2f s, theta = %.3f rad', t(k), theta));
    drawnow;
end

