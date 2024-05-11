function root = NewtonRaphson(a, x0, error)


    syms x; % Define symbolic variable
    
    % Convert the input string to a symbolic function
    symFunc = str2sym(a);

    % Create function handle from symbolic expression
    f = matlabFunction(symFunc, 'Vars', x);

    % Calculate the derivative of the function
    dif = diff(symFunc);

    % Create a function handle for the derivative
    d = matlabFunction(dif, 'Vars', x);

    % Initialize iteration variables
    xVec(1) = x0;
    err = inf; % Set initial error to infinity
    i = 1;

    % Iteration loop
    while err > error
        % Calculate the next guess using Newton-Raphson formula
        xVec(i+1) = xVec(i) - f(xVec(i))/d(xVec(i));
        
        % Calculate the error
        err = abs(xVec(i+1) - xVec(i));
        
        % Update iteration counter
        i = i + 1;
        
        % Check for convergence
        if err < error
            break; % Exit loop if error is within specified tolerance
        end
        
        % Optional: Break after a maximum number of iterations to avoid infinite loop
        if i > 100
            disp('Maximum iterations reached without convergence.');
            break;
        end
    end

    % Return the last computed value as the root
    root = xVec(i);
end
