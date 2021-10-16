function [ExperimentalStack] = generateGlobal(ExperimentalStack)

% Darik O'Neil MBL Neuro 2021 Team Hoppa

%% IMPORT
numConditions = ExperimentalStack.numConditions; %import number of conditions
numTrials = ExperimentalStack.numTrials; %import number of trials per conditions
numFrames = ExperimentalStack.lenTrials; %import number of frame sper trial

ExperimentalStack.Global_SynROIs = zeros(1,numTrials*numConditions*numFrames);

for a = 1:numConditions
    for b = 1:numTrials
        c=(numFrames*numTrials)*(a-1);
        ExperimentalStack.Global_SynROIs((c+1+((b-1)*numFrames)):(c+numFrames+((b-1)*numFrames)))=ExperimentalStack.Conditions{2,a}.trials{b}.meanSynROIs;
    end
end

end

