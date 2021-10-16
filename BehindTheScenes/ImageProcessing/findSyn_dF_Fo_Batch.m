function [ExperimentalStack] = findSyn_dF_Fo_Batch(ExperimentalStack)
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
        [SynBaseline,SynBuffer,Syn_dF_Fo] = findSyn_dF_Fo(ExperimentalStack.Conditions{2,a}.trials{b}.SynFilt,100,100);
        ExperimentalStack.Conditions{2,a}.trials{b}.Syn_dF_Fo = Syn_dF_Fo;
        ExperimentalStack.Conditions{2,a}.trials{b}.SynBaseline = SynBaseline;
        ExperimentalStack.Conditions{2,a}.trials{b}.SynBuffer = SynBuffer;
        ExperimentalStack.Conditions{2,a}.trials{b}.meanSyn_dF_Fo =  mean(ExperimentalStack.Conditions{2,a}.trials{b}.Syn_dF_Fo,2);
    end
end

%% 
ExperimentalStack.Global_Syn_dF_Fo = zeros(1,numTrials*numConditions*numFrames);
%% 
for a = 1:numConditions
    for b = 1:numTrials
        c=(numFrames*numTrials)*(a-1);
        ExperimentalStack.Global_Syn_dF_Fo((c+1+((b-1)*numFrames)):(c+numFrames+((b-1)*numFrames)))=ExperimentalStack.Conditions{2,a}.trials{b}.meanSyn_dF_Fo;
    end
end

