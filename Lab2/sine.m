% sine.m
% Script to plot the sine of x from -1 to 1 in steps of 0.1

x = -1:0.1:1; 
y = sin(x); 

plot(x, y); % Plot the sine function
title('Sine of x from -1 to 1'); 
xlabel('x'); 
ylabel('sin(x)'); 
grid on; 
