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

function [colleaguesLimits]= colleaguesLimitsGenerator(degree,searchAgents)

colleaguesLimits = zeros(searchAgents,2);
for c = searchAgents: -1 : 1
    hi = ceil((log10(c * degree - c + 1)/log10(degree))) - 1;
    lowerLim = ((degree * degree^(hi-1) - 1)/(degree-1) + 1);
    upperLim = (degree * degree^hi - 1)/(degree-1);
    colleaguesLimits(c,1) = lowerLim;
    colleaguesLimits(c,2) = upperLim;
end

%colleaguesLimits;
end