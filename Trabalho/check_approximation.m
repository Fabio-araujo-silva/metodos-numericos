function check_approximation(x_approx, x_exact)
    % Ensure both vectors are column vectors
    x_approx = x_approx(:);
    x_exact = x_exact(:);
    
    % Check same size
    if length(x_approx) ~= length(x_exact)
        error('Vectors must be of the same length.');
    end

    % Absolute error
    abs_error = abs(x_approx - x_exact);

    % Relative error (element-wise)
    rel_error = abs_error ./ (abs(x_exact) + eps);  % eps avoids division by zero

    % Norms
    norm_diff = norm(x_approx - x_exact);           % L2 norm of the difference
    rel_norm = norm_diff / (norm(x_exact) + eps);   % Relative norm error

    % Display results
    fprintf('Absolute error (per element):\n');
    disp(abs_error);

    fprintf('Relative error (per element):\n');
    disp(rel_error);

    fprintf('L2 norm of difference: %e\n', norm_diff);
    fprintf('Relative L2 norm error: %e\n', rel_norm);
end
