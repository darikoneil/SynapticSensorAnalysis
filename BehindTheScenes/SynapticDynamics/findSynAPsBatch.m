function [ExperimentalStack] = findSynAPsBatch(ExperimentalStack)
%Darik O'Neil MBL Neuro 2021 Team Hoppa


%% IMPORT & PREALLOCATE
numConditions = ExperimentalStack.numConditions; %import number of conditions
numTrials = ExperimentalStack.numTrials; %import number of trials per conditions
numFrames = ExperimentalStack.lenTrials; %import number of frames per trial
numSyn = size(ExperimentalStack.Conditions{2,1}.trials{2}.SynROIs,2);

for a = 1:numConditions
    for b = 1:numTrials
       [SynAPL, SynAPP, SynFWHM, SynAPK, SynMini] = find_SynAPs(ExperimentalStack.Conditions{2,a}.trials{b}.Syn_dFdTFo);
       ExperimentalStack.Conditions{2,a}.trials{b}.SynAPL = SynAPL;
       ExperimentalStack.Conditions{2,a}.trials{b}.SynAPP = SynAPP;
       ExperimentalStack.Conditions{2,a}.trials{b}.SynFWHM = SynFWHM;
       ExperimentalStack.Conditions{2,a}.trials{b}.SynAPK = SynAPK;
       ExperimentalStack.Conditions{2,a}.trials{b}.SynMini = SynMini;
    end
end


ExperimentalStack.Global_Syn_dFdTFo_Multi = zeros(numTrials*numConditions*numFrames,numSyn);

for a = 1:numConditions
    for b = 1:numTrials
        for d= 1:numSyn
            c=(numFrames*numTrials)*(a-1);
            ExperimentalStack.Global_Syn_dFdTFo_Multi((c+1+((b-1)*numFrames)):(c+numFrames+((b-1)*numFrames)),d)=ExperimentalStack.Conditions{2,a}.trials{b}.Syn_dFdTFo(:,d);
        end
    end
end

end



       
        

