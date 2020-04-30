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


function [lb,ub,dim,fobj] = multimodalVariableDim(F)

%Fixed dim functions will change it
dim = 30;

switch F
    %Schwefel's 2.26
    case 'F1'
        fobj = @F1;
        lb=-500;
        ub=500;
        
    %Rastrigin
    case 'F2'
        fobj = @F2;
        lb=-5.12;
        ub=5.12;
        
    %Periodic
    case 'F3'
        fobj = @F3;
        lb=-10;
        ub=10;
        
    %Qing
    case 'F4'
        fobj = @F4;
        lb=-500;
        ub=500;
        
    %Alpine N. 1
    case 'F5'
        fobj = @F5;
        lb=-10;
        ub=10;
        
    %Xin-She Yang
    case 'F6'
        fobj = @F6;
        lb=-5;
        ub=5;
        
    %Ackley
    case 'F7'
        fobj = @F7;
        lb=-32;
        ub=32;
        
    %Trignometric 2
    case 'F8'
        fobj = @F8;
        lb=-500;
        ub=500;

    %Salomon
    case 'F9'
        fobj = @F9;
        lb=-100;
        ub=100;
        
    %Styblinski-Tang
    case 'F10'
        fobj = @F10;
        lb=-5;
        ub=5;
        
    %Griewank
    case 'F11'
        fobj = @F11;
        lb=-100;
        ub=100;
        
    %Xin-She Yang N. 4
    case 'F12'
        fobj = @F12;
        lb=-10;
        ub=10;
        
    %Xin-She Yang N. 2
    case 'F13'
        fobj = @F13;
        lb=-2*pi;
        ub=2*pi;
        
    %Gen. Pendlized
    case 'F14'
        fobj = @F14;
        lb=-50;
        ub=50;
        
    %Pendlized
    case 'F15'
        fobj = @F15;
        lb=-50;
        ub=50; 
        
    %Michalewics
    case 'F16'
        fobj = @F16;
        lb=0;
        ub=pi;    
            
    %Quartic Noise
    case 'F17'
        fobj = @F17;
        lb=-1.28;
        ub=1.28;

end

end

% F1 - Schwefel's 2.26
function o = F1(x)
dim=size(x,2);
o=418.9829 - sum(-x.*sin(sqrt(abs(x))))/dim;
end

% F2 - Rastrigin
function o = F2(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end

% F3 - Periodic
function o = F3(x)
    sin2x = sin(x) .^ 2;
    sumx2 = sum(x .^2, 2);
    o = 1 + sum(sin2x, 2) -0.1 * exp(-sumx2);
end

% F4 - Qing
function o = F4(x)
    n = size(x, 2);
    x2 = x .^2;
    
    o = 0;
    for i = 1:n
        o = o + (x2(:, i) - i) .^ 2;
    end
end

% F5 - Alpine N. 1
function o = F5(x)
     o = sum(abs(x .* sin(x) + 0.1 * x), 2);
end

% F6 - Xin-She Yang
function o = F6(x)
    n = size(x, 2);
    o = 0;
    for i = 1:n
        o = o + rand * (abs(x(:, i)) .^ i);
    end
end

% F7 - Ackley
function o = F7(x)
    n = size(x, 2);
    ninverse = 1 / n;
    sum1 = sum(x .^ 2, 2);
	sum2 = sum(cos(2 * pi * x), 2);
    
    o = 20 + exp(1) - (20 * exp(-0.2 * sqrt( ninverse * sum1))) - exp( ninverse * sum2);
end

% F8 - Trignometric 2
function o = F8(x)
    n = size(x, 2);
    
    o = 1;
    for i = 1:n
        o = o + 8*sin(7*(x(i)-0.9)^2)^2+6*sin(14*(x(1)-0.9)^2)^2+(x(i)-0.9)^2;
    end
end

% F9 - Salomon
function o = F9(x)
    x2 = x .^ 2;
    sumx2 = sum(x2, 2);
    sqrtsx2 = sqrt(sumx2);
    
    o = 1 - cos(2 .* pi .* sqrtsx2) + (0.1 * sqrtsx2);
end

% F10 - Styblinski-Tang
function o = F10(x)
    n = size(x, 2);
    o = 0;
    for i = 1:n
        o = o + ((x(:, i) .^4) - (16 * x(:, i) .^ 2) + (5 * x(:, i)));
    end
    o = 0.5 * o;
end

% F11 - Griewank
function o = F11(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% F12 - Xin-She Yang N. 4
function o = F12(x)
     o = (sum(sin(x) .^2, 2) - exp(-sum(x .^ 2, 2))) .* exp(-sum(sin(sqrt(abs(x))) .^2, 2));
end

% F13 - Xin-She Yang N. 2
function o = F13(x)
    o = sum(abs(x), 2) .* exp(-sum(sin(x .^2), 2));
end

%Helping function for F14, F15
function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end

% F14 - Gen. Pendlized
function o = F14(x)
dim=size(x,2);
o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% F15 - Pendlized
function o = F15(x)
dim=size(x,2);
o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
(1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end

% F16 - Michalewics
function o = F16(x)
n=size(x,2);
m = 10;
s = 0;
for i = 1:n;
    s = s+sin(x(i))*(sin(i*x(i)^2/pi))^(2*m);
end
o = -s;
end

% F17 - Quartic Noise
function o = F17(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end

