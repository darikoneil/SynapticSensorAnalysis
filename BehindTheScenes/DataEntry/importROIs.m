function [ExperimentalStack]=importROIs(conditions, indices, times, framerate, filename)

%Darik O'Neil MBL Neuro 2021 Team Hoppa

%% Import Raw ROI
if nargin <5
    filename = uigetfile('*.xlsx'); %find da big boi file
end

[~,sheets] = xlsfinfo(filename); %find info
data_sheets = cell(1,numel(sheets)); %preallocate
for k=1:(numel(sheets)) %iterate & fill
    data_sheets{k} = xlsread(filename,sheets{k}); %fill
end 

%% Generate Repeated Constants
numConditions = numel(conditions); %number of conditions
numTrials = size(times,2); %number of trials per condition; MUST BE EQUAL & BALANCED

%% Formalize Conditions & Preallocation in Experimental Stack Structure

ExperimentalStack = struct(); %Preallocate Data Structure
ExperimentalStack.Conditions = cell(2,numConditions); %Preallocate Conditions

%Iterate to Enter Conditions Headers
for a = 1:numConditions
    ExperimentalStack.Conditions{1,a}=conditions{a}; 
end

%Preallocate Secondary Structures (Trials, Timing)
for b = 1:numConditions
    ExperimentalStack.Conditions{2,b}=struct();
    ExperimentalStack.Conditions{2,b}.trials = cell(1,numTrials); %trials
    ExperimentalStack.Conditions{2,b}.times = cell(1,numTrials); %times
end

%% Importing Individual Trials
for c= 1:numConditions
    for d = 1: numTrials %numTrials
        ExperimentalStack.Conditions{2,c}.trials{d} = struct();
        ExperimentalStack.Conditions{2,c}.trials{d}.SynROIs = manualSynROIs2(data_sheets{((c-1)*5)+d}); %Import Trial Data
        ExperimentalStack.Conditions{2,c}.trials{d}.meanSynROIs = mean(ExperimentalStack.Conditions{2,c}.trials{d}.SynROIs,2); %Find mean of trial
    end
end

%% Miscellaneous Storage
%Store Condition Indices
indices = reshape([1:numel(indices)],numTrials,numConditions); %quick fix index
ExperimentalStack.Index = indices; %Store in Structure

%Store Miscellaneous
ExperimentalStack.framerate = framerate;
ExperimentalStack.filename = filename;
ExperimentalStack.numTrials = numTrials;
ExperimentalStack.numConditions = numConditions;
ExperimentalStack.lenTrials = size(ExperimentalStack.Conditions{2,1}.trials{1}.SynROIs,1);

end







