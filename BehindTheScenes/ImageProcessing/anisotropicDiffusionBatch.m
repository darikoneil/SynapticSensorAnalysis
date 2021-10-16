function [ExperimentalStack] = anisotropicDiffusionBatch(ExperimentalStack)

%Darik O'Neil MBL Neuro 2021 Team Hoppa
%Makes Time Vector

%% IMPORT & PREALLOCATE
numConditions = ExperimentalStack.numConditions; %import number of conditions
numTrials = ExperimentalStack.numTrials; %import number of trials per conditions
numFrames = ExperimentalStack.lenTrials; %import number of frame sper trial
gT = ExperimentalStack.gT;

%%
for a = 1:numConditions
    for b = 1:numTrials
        [ExperimentalStack.Conditions{2,a}.trials{b}.SynFilt] = anisotropicDiffusion(ExperimentalStack.Conditions{2,a}.trials{b}.SynROIs,gT);
        ExperimentalStack.Conditions{2,a}.trials{b}.meanSynFilt =  mean(ExperimentalStack.Conditions{2,a}.trials{b}.SynFilt,2);
    end
end
%% 
ExperimentalStack.Global_SynFilt = zeros(1,numTrials*numConditions*numFrames);
%% 
for a = 1:numConditions
    for b = 1:numTrials
        c=(numFrames*numTrials)*(a-1);
        ExperimentalStack.Global_SynFilt((c+1+((b-1)*numFrames)):(c+numFrames+((b-1)*numFrames)))=ExperimentalStack.Conditions{2,a}.trials{b}.meanSynFilt;
    end
end

end
