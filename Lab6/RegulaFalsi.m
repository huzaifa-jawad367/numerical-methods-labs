function root = RegulaFalsi(f, a, b, tol)
% Regular Falsi Method to find the root of the equation f(x)=0
% Inputs:
%   f   - Function handle for f(x)
%   a   - Lower initial guess
%   b   - Upper initial guess
%   tol - Tolerance

% Check if the initial guesses bracket the root
if f(a) * f(b) > 0
    disp('Incorrect initial guesses. The guesses do not bracket the root.');
    root = NaN;
    return;
end

c = a; % Initialize c to ensure it has a value before the loop

% Iterate until the function value at c is less than the tolerance
while true
    % Apply the False Position formula
    c_prev = c; % Store previous value of c to check convergence
    c = b - (f(b) * (a - b)) / (f(a) - f(b));
    
    % Check for convergence
    if abs(f(c)) < tol
        break; % The root has been found to the desired tolerance
    end
    
    % Prepare for the next iteration
    if f(a) * f(c) < 0
        b = c; % The root lies between a and c
    else
        a = c; % The root lies between c and b
    end
    
    % Check if the change is within the tolerance
    if abs(c - c_prev) < tol
        break; % The approximation has converged to the root
    end
end

root = c; % The approximated root
end
