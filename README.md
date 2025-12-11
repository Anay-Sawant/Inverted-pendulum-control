# Inverted-pendulum-control
MATLAB simulation and control of an inverted pendulum using PD and two-loop cascade control. Includes nonlinear dynamics, animation, and analysis.

/cartpole_ode.m          → Nonlinear dynamics of the cart-pole

/cartpole_ode_PD.m       → Cascade PD controller implementation

/run_openloop_cartpole.m → Main script with simulation + plots

.gitignore               → To keep repo clean

MODEL AND EQUATIONS USED:

The inverted pendulum on a cart is a classic nonlinear control problem.

The state variables are:

X — cart position (m) ,   X'— cart velocity (m/s) ,   θ — pendulum angle from upright (rad) ,   θ'— angular velocity (rad/s)

Control input:

u — horizontal force applied to the cart (N)

System parameters:

M — mass of cart ,   m — mass of pendulum ,   l — length from pivot to pendulum COM ,   g — gravity

Equation of Motion

The dynamics follow the standard nonlinear cart–pole model.

Intermediate Variables:

S = Sin(θ) ,  C = Cos(θ),   Denominator = M + m

Pendulum Angular Acceleration θ'' :

<img width="404" height="177" alt="image" src="https://github.com/user-attachments/assets/8df0f893-416c-4ac2-801c-94aaae3893cf" />

This comes from Newton's laws applied to the pendulum about its pivot and represents a strongly nonlinear equation.

Cart Horizontal Acceleration X'' :

<img width="411" height="154" alt="image" src="https://github.com/user-attachments/assets/dc6313b7-1ed6-423c-81c5-277041ed8395" />

The cart dynamics depend on pendulum motion because the pendulum exerts a horizontal reaction force on the cart.

Final State-Space Form

<img width="256" height="221" alt="Screenshot 2025-12-11 155430" src="https://github.com/user-attachments/assets/80997ee1-f0af-4a3a-86d7-c274e5df1110" />

​

This system is nonlinear, coupled, and unstable around the upright equilibrium — making it ideal for testing control strategies.

PD Control for the Inverted Pendulum

To stabilize the pendulum in the upright position, a Proportional–Derivative (PD) controller is used on the pendulum angle:

uθ= − Kp θ − Kd θ'

What PD control does

Kp - pushes the pendulum back toward upright whenever it deviates.

Kd - damps the motion by opposing angular velocity, preventing oscillation.

Because the pendulum dynamics are naturally unstable and fast, PD control provides a quick corrective force that reacts to both angle error and angular velocity.

Open Loop response of system :

<img width="1348" height="893" alt="Screenshot 2025-12-09 152935" src="https://github.com/user-attachments/assets/e872d33b-cc53-47d3-8ca3-116113d25e9c" />

PD Closed loop response of system : 

<img width="1310" height="816" alt="Screenshot 2025-12-11 160148" src="https://github.com/user-attachments/assets/b7c2b0b3-29a6-4fa4-9e13-2e9c26b9f94e" />

Operating gif:

![cartpole](https://github.com/user-attachments/assets/4e4c28b9-c38e-45f1-97a7-74c2490f80dd)

HOW TO RUN:

Clone the repo:
git clone https://github.com/Anay-Sawant/inverted-pendulum-control

Open MATLAB and run:
run_openloop_cartpole.m

