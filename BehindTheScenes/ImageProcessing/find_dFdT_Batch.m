function [ExperimentalStack] = find_dFdT_Batch(ExperimentalStack)
%Darik O'Neil MBL Neuro 2021 Team Hoppa
%Makes Time Vector

%% IMPORT & PREALLOCATE
numConditions = ExperimentalStack.numConditions; %import number of conditions
numTrials = ExperimentalStack.numTrials; %import number of trials per conditions
numFrames = ExperimentalStack.lenTrials; %import number of frame sper trial

%%
%%
for a = 1:numConditions
    for b = 1:numTrials
        ExperimentalStack.Conditions{2,a}.trials{b}.Syn_dFdT = find_dFdT(ExperimentalStack.Conditions{2,a}.trials{b}.SynFilt);
        ExperimentalStack.Conditions{2,a}.trials{b}.meanSyn_dFdT =  mean(ExperimentalStack.Conditions{2,a}.trials{b}.Syn_dFdT,2);
    end
end

%% 
ExperimentalStack.Global_Syn_dFdT = zeros(1,numTrials*numConditions*numFrames);
%% 
for a = 1:numConditions
    for b = 1:numTrials
        c=(numFrames*numTrials)*(a-1);
        ExperimentalStack.Global_Syn_dFdT((c+1+((b-1)*numFrames)):(c+numFrames+((b-1)*numFrames)))=ExperimentalStack.Conditions{2,a}.trials{b}.meanSyn_dFdT;
    end
end

end
