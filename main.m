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

clear all
clc

global cycles
global degree

%benchmarksType = 1 for Unimodal Fixed-Dim
%benchmarksType = 2 for Unimodal Variable-Dim
%benchmarksType = 3 for Multimodal Fixed-Dim
%benchmarksType = 4 for Multimodal Variable-Dim
%benchmarksType = 5 for CEC-BC-2017
benchmarksType = 1;

if benchmarksType == 1
    maxFunc = 9;
elseif benchmarksType == 2
    maxFunc = 15;
elseif benchmarksType == 3
    maxFunc = 27;
elseif benchmarksType == 4
    maxFunc = 17;
elseif benchmarksType == 5
    maxFunc = 30;
else
    exit;
end

SearchAgents_no = 40;
Max_iteration= 1282; %50000 F.EV / 39 agents = 1282 iterations
runs = 30;
cycles = floor(Max_iteration/25);
degree = 3;

for fn = 1:maxFunc
    
    Function_name=strcat('F',num2str(fn));
    if benchmarksType == 1
        [lb,ub,dim,fobj]=unimodalFixedDim(Function_name);
    elseif benchmarksType == 2
        [lb,ub,dim,fobj]=unimodalVariableDim(Function_name);
    elseif benchmarksType == 3
        [lb,ub,dim,fobj]=multimodalFixedDim(Function_name);
    elseif benchmarksType == 4
        [lb,ub,dim,fobj]=multimodalVariableDim(Function_name);
    elseif benchmarksType == 5
        if fn == 2
            continue;   %To skip function-2 of CEC-BC-2017 because of its unstable behavior
        end
        [lb,ub,dim,fobj]=CEC2017(Function_name);
    end
    
    % Calling algorithm
    Best_score_T = zeros(runs,1);
    AvgConvCurve = zeros(Max_iteration,1);
    display (['Function:   ', num2str(fn)]);
    for run=1:runs
        %rng('shuffle');
        [Best_score_0, Best_pos, cg_curve]=HBO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        Best_score_T(run) = Best_score_0;
        %AvgConvCurve = AvgConvCurve + cg_curve';
        
        display(['Run: ', num2str(run), '         ', 'Fitness: ', num2str(Best_score_0), '     ', 'Position:      ', num2str(Best_pos)]);
    end
    %pause
    Best_score_Best = min(Best_score_T);
    Best_score_Worst = max(Best_score_T);
    Best_score_Median = median(Best_score_T);
    Best_Score_Mean = mean(Best_score_T);
    Best_Score_std = std(Best_score_T);
    %AvgConvCurve = AvgConvCurve ./ runs;
    
    format long
    display(['Median:  ', num2str(Best_score_Median), '     ', 'Mean:  ', num2str(Best_Score_Mean), '     ', 'Std. Deviation:  ', num2str(Best_Score_std)]);
    
end
