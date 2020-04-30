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


function [lb,ub,dim,fobj] = multimodalFixedDim(F)

switch F        
    %Egg Crate
    case 'F1'
        fobj = @F1;
        lb=-5;
        ub=5;
        dim=2;
        
    %Ackley N.3
    case 'F2'
        fobj = @F2;
        lb=-32;
        ub=32;
        dim=2;
        
    %Adjiman 
    case 'F3'
        fobj = @F3;
        lb=-1;
        ub=2;
        dim=2;
        
    %Bird
    case 'F4'
        fobj = @F4;
        lb=-2*pi;
        ub=2*pi;
        dim=2;
        
    %Camel 6 Hump
    case 'F5'
        fobj = @F5;
        lb=-5;
        ub=5;
        dim=2;
        
    %Branin RCOS
    case 'F6'
        fobj = @F6;
        lb=-5;
        ub=5;
        dim=2;
        
    %Goldstien Price
    case 'F7'
        fobj = @F7;
        lb=-2;
        ub=2;
        dim=2;
        
    %Hartman 3
    case 'F8'
        fobj = @F8;
        lb=0;
        ub=1;
        dim=3;
        
    %Hartman 6
    case 'F9'
        fobj = @F9;
        lb=0;
        ub=1;
        dim=6;
        
    %Cross-in-tray
    case 'F10'
        fobj = @F10;
        lb=-10;
        ub=10;
        dim=2;
        
    %Bartels Conn
    case 'F11'
        fobj = @F11;
        lb=-500;
        ub=500;
        dim=2;
        
    %Bukin 6
    case 'F12'
        fobj = @F12;
        lb= [-15 -3] ;
        ub= [-5 -3] ;
        dim=2;
        
    %Carrom Table
    case 'F13'
        fobj = @F13;
        lb=-10;
        ub=10;
        dim=2;
        
    %Chichinadze
    case 'F14'
        fobj = @F14;
        lb=-30;
        ub=30;
        dim=2;
        
    %Cross function
    case 'F15'
        fobj = @F15;
        lb=-10;
        ub=10;
        dim=2;
        
    %Cross leg table
    case 'F16'
        fobj = @F16;
        lb=-10;
        ub=10;
        dim=2;
        
    %Crowned cross
    case 'F17'
        fobj = @F17;
        lb=-10;
        ub=10;
        dim=2;
        
    %Easom
    case 'F18'
        fobj = @F18;
        lb=-100;
        ub=100;
        dim=2;
        
    %Giunta
    case 'F19'
        fobj = @F19;
        lb=-1;
        ub=1;
        dim=2;
        
    %Heli Cal Valley
    case 'F20'
        fobj = @F20;
        lb=-10;
        ub=10;
        dim=3;
        
    %Himmelblau
    case 'F21'
        fobj = @F21;
        lb=-5;
        ub=5;
        dim=2;
        
    %Holder Table 2
    case 'F22'
        fobj = @F22;
        lb=-10;
        ub=10;
        dim=2;
        
    %Pen Holder
    case 'F23'
        fobj = @F23;
        lb=-11;
        ub=11;
        dim=2;
        
    %Test Tube Holder 
    case 'F24'
        fobj = @F24;
        lb=-10;
        ub=10;
        dim=2;
        
    %Shubert
    case 'F25'
        fobj = @F25;
        lb=-10;
        ub=10;
        dim=2;
        
    %Shekel
    case 'F26'
        fobj = @F26;
        lb=0;
        ub=10;
        dim=4;
        
    %Three-Hump Camel
    case 'F27'
        fobj = @F27;
        lb=-5;
        ub=5;
        dim = 2;
end

end

% F1 - Egg crate
function o = F1(x)
    n = size(x, 2);
    assert(n == 2, 'The Egg Crate function is defined only on the 2-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = X.^2 + Y.^2 + (25 * (sin(X).^2 + sin(Y).^2));
end

% F2 - Ackley N.3
function o = F2(x)
    n = size(x, 2);
    assert(n == 2, 'Ackley N. 3 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = -200 * exp(-0.02 * sqrt((X .^ 2) + (Y .^ 2))) + ...
             5 * exp(cos(3 * X) + sin(3 * Y));
end

% F3 - Adjiman
function o = F3(x)
    n = size(x, 2);
    assert(n == 2, 'Adjiman function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (cos(X) .* sin(Y)) - (X ./ ((Y .^ 2) + 1));
end

% F4 - Bird
function o = F4(x)
    n = size(x, 2);
    assert(n == 2, 'Bird function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = sin(X) .* exp((1 - cos(Y)).^2) + ... 
        cos(Y) .* exp((1 - sin(X)) .^ 2) + ...
        (X - Y) .^ 2;
end

% F5 - Camel 6 Hump
function o = F5(x)
o=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end

% F6 - Branin CROS
function o = F6(x)
o=(x(2)-(x(1)^2)*5.1/(4*(pi^2))+5/pi*x(1)-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;
end

% F7 - Goldstien Price
function o = F7(x)
o=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end

% F8 - Hartman 3
function o = F8(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F9 - Hartman 6
function o = F9(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
.2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F10 - Cross in tray
function o = F10(x)
    n = size(x, 2);
    assert(n == 2, 'The Cross-in-tray function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);

    expcomponent = abs(100 - (sqrt(X .^2 + Y .^2) / pi));
    
    o = -0.0001 * ((abs(sin(X) .* sin(Y) .* exp(expcomponent)) + 1) .^ 0.1);
end

% F11 - Bartels Conn
function o = F11(x)
    n = size(x, 2);
    assert(n == 2, 'Bartels Conn function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = abs((X .^ 2) + (Y .^ 2) + (X .* Y)) + abs(sin(X)) + abs(cos(Y));
end

% F12 - Bukin 6
function o = F12(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        o = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1 + 10);
end

% F13 - Carrom Table
function o = F13(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        o = -((cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi))).^2)/30;
end

% F14 - Chichinadze
function o = F14(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        o = x1.^2 - 12*x1 + 11 + 10*cos(pi*x1/2) + 8*sin(5*pi*x1/2) - ...
            1/sqrt(5)*exp(-((x2 - 0.5).^2)/2);

end

% F15 - Cross function
function o = F15(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        % output function value
        o= (abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);

end

% F16 - Cross leg table
function o = F16(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        % output function value
        o = -(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);

end

% F17 - Crowned cross
function o = F17(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        % output function value
        o = 0.0001*(abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(0.1);

end

% F18 - Easom
function o = F18(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        % output function value
        o = -cos(x1).*cos(x2).*exp(-((x1-pi).^2 + (x2-pi).^2));

end

% F19 - Giunta
function o = F19(X)
        % compute sine argument
        arg = 16*X/15 - 1;

        % split input vector X into x1, x2
        if size(X, 1) == 2
            % output function value as rowsum
            o = 0.6 + sum(sin(arg) + sin(arg).^2 + sin(4*arg)/50, 1);
        else
            % output function value as columnsum
            o = 0.6 + sum(sin(arg) + sin(arg).^2 + sin(4*arg)/50, 2);
        end

end

% F20 - Helical Valley
function o = F20(X)
        % split input vector X into x1, x2, x3
        if size(X, 1) == 3
            x1 = X(1, :);  x2 = X(2, :);  x3 = X(3, :);
        else
            x1 = X(:, 1);  x2 = X(:, 2);  x3 = X(:, 3);
        end

        % output function value
        o = 100*((x3 - 10*atan2(x2, x1)/2/pi).^2 + (sqrt(x1.^2 + x2.^2) - 1).^2) + x3.^2;

end

% F21 - Himmelblau
function o = F21(X)

        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % function output
        o = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;
end

% F22 - Holder Table 2
function o = F22(X)

        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        o = -abs(sin(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)));
end

% F23 - Pen Holder
function o = F23(X)

        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        o = -exp(-(abs(cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)))).^(-1));
end

% F24 - Test Tube Holder
function o = F24(X)

        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end

        % output function value
        o = -4*abs(sin(x1).*cos(x2).*exp(abs(cos((x1.^2 + x2.^2)/200))));
end

% F25 - Shubert
function o = F25(x)
s1 = 0; 
s2 = 0;
for i = 1:5;   
    s1 = s1+i*cos((i+1)*x(1)+i);
    s2 = s2+i*cos((i+1)*x(2)+i);
end
o = s1*s2;
end

% F26 - Shekel
function o = F26(x)
m = 10;
a = ones(10,4);
a(1,:) = 4.0*a(1,:);
a(2,:) = 1.0*a(2,:);
a(3,:) = 8.0*a(3,:);
a(4,:) = 6.0*a(4,:);
for j = 1:2;
   a(5,2*j-1) = 3.0; a(5,2*j) = 7.0; 
   a(6,2*j-1) = 2.0; a(6,2*j) = 9.0; 
   a(7,j)     = 5.0; a(7,j+2) = 3.0;
   a(8,2*j-1) = 8.0; a(8,2*j) = 1.0;
   a(9,2*j-1) = 6.0; a(9,2*j) = 2.0;
   a(10,2*j-1)= 7.0; a(10,2*j)= 3.6;
end
c(1) = 0.1; c(2) = 0.2; c(3) = 0.2; c(4) = 0.4; c(5) = 0.4;
c(6) = 0.6; c(7) = 0.3; c(8) = 0.7; c(9) = 0.5; c(10)= 0.5;
s = 0;
for j = 1:m;
   p = 0;
   for i = 1:4
      p = p+(x(i)-a(j,i))^2;
   end
   s = s+1/(p+c(j));
end
o = -s;
end

% F27 - Three hump camel
function o = F27(x)
    n = size(x, 2);
    assert(n == 2, 'The Three-hump camel function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (2 * X .^ 2) - (1.05 * (X .^ 4)) + ((X .^ 6) / 6) + X .* Y + Y .^2;
end
