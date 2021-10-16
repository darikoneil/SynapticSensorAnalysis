function [SynBaseline,SynBuffer,Syn_dF_Fo] = findSyn_dF_Fo(SynROIs,b1,b2)

%Darik O'Neil MBL Neuro 2021 Team Hoppa
%Makes Time Vector
numSyn = size(SynROIs,2); %numSyn
Syn_dF_Fo = zeros(size(SynROIs)); %preallocation

SynBaseline = zeros(1,numSyn); %Baseline preallocation

SynROIs = transpose(SynROIs); %b/c lazy
tempVec = 1:size(SynROIs,2); %Frame Index
bufferTime = [1:b1 tempVec(end-(b2-1)):tempVec(end)]; %buffer time
SynBuffer = zeros(numSyn,length(bufferTime)); %

for i = 1:numSyn
   SynBuffer(i,:) = SynROIs(i, bufferTime);
   SynBaseline(1,i) = mean(SynBuffer(i,:));
   Syn_dF_Fo(:,i) = (SynROIs(i,:)-SynBaseline(1,i))./SynBaseline(1,i);
end

SynBuffer = transpose(SynBuffer); %redo transpose b/c lazy

end

    


