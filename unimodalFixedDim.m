%_________________________________________________________________________________
%  Heap-based optimizer inspired by corporate rank hierarchy for global
%  optimization source codes version 1.0
%
%  Developed in MATLAB R2015a
%
%  Author and programmer: Qamar Askari
%
%         e-Mail: l165502@lhr.nu.edu.pk
%                 syedqamar@gift.edu.pk
%
%
%   Main paper:
%   Askari, Q., Saeed, M., & Younas, I. (2020). Heap-based optimizer
%   inspired by corporate rank hierarchy for global optimization.
%   Expert Systems with Applications, 2020,
%____________________________________________________________________________________


function [lb,ub,dim,fobj] = unimodalFixedDim(F)

switch F
    %Beale
    case 'F1'
        fobj = @F1;
        lb=-4.5;
        ub=4.5;
        dim=2;
        
    %Booth
    case 'F2'
        fobj = @F2;
        lb=-10;
        ub=10;
        dim=2;     
        
    %Brent
    case 'F3'
        fobj = @F3;
        lb=-10;
        ub=10;
        dim=2;    
        
    %Matyas
    case 'F4'
        fobj = @F4;
        lb=-10;
        ub=10;
        dim=2;    
        
    %Schaffer N. 4
    case 'F5'
        fobj = @F5;
        lb=-100;
        ub=100;
        dim=2;    
        
    %Wayburn Seader
    case 'F6'
        fobj = @F6;
        lb=-500;
        ub=500;
        dim=2;     
        
    %Leon
    case 'F7'
        fobj = @F7;
        lb=-1.2;
        ub=1.2;
        dim=2;     
        
    %Cube
    case 'F8'
        fobj = @F8;
        lb=-10;
        ub=10;
        dim=2;     
        
    %Zettl
    case 'F9'
        fobj = @F9;
        lb=-5;
        ub=10;
        dim=2;     
        
end

end

% F1 - Beale
function o = F1(x)
    n = size(x, 2);
    assert(n == 2, 'Beale''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (1.5 - X + (X .* Y)).^2 + ...
             (2.25 - X + (X .* (Y.^2))).^2 + ...
             (2.625 - X + (X .* (Y.^3))).^2;
end

% F2 - Booth
function o = F2(x)
    n = size(x, 2);
    assert(n == 2, 'Booth''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (X + (2 * Y) - 7).^2 + ( (2 * X) + Y - 5).^2;
end

% F3 - Brent
function o = F3(x)
    n = size(x, 2);
    assert(n == 2, 'Brent''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
 
    o = (X+10)^2 + (Y+10)^2 + exp(-X^2 - Y^2);
end

% F4 - Matyas
function o = F4(x)
o=0.26*(x(1)^2+x(2)^2) - 0.48*x(1)*x(2);
end


% F5 - Schaffer N. 4
function o = F5(x)
    n = size(x, 2);
    assert(n == 2, 'Schaffer function N. 4 is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    numeratorcomp = (cos(sin(abs(X .^ 2 - Y .^ 2))) .^ 2) - 0.5; 
    denominatorcomp = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
    o = 0.5 + numeratorcomp ./ denominatorcomp;
end

% F6 - Wayburn Seader 3
function o = F6(x) 
    o = 2/3*x(1)^3-8*x(1)^2+33*x(1)-x(1)*x(2)+5+((x(1)-4)^2+(x(2)-5)^2-4)^2;
end

% F7 - Leon
function o = F7(x) 
    n = size(x, 2);
    assert(n == 2, 'Leon function is defined only on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = 100 * ((Y - X.^3) .^2) + ((1 - X) .^2);
end

% F8 - Cube
function o = F8(X) 
        % split input vector X into X1, X2
        X1 = X(1:end-1, :);    X2 = X(2:end, :);

        % output columnsum
        o = sum(  100*(X2 - X1.^3).^2 + (1 - X1).^2);
        o = sum(o);
end

% F9 - Zettl
function o = F9(X) 
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        o = (x1.^2 + x2.^2 - 2*x1).^2 + x1/4;
end
