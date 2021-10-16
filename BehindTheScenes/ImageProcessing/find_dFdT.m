function [Syn_dFdT] = find_dFdT(SynROIs)

%Darik O'Neil MBL Neuro 2021 Team Hoppa
%Makes Time Vector

numSyn = size(SynROIs,2); %number of synapses
SynROIs = transpose(SynROIs); %transpose b/c lazy

Syn_dFdT = zeros(size(SynROIs)); %preallocate for speed
for i = 1:numSyn
    Syn_dFdT(i,:) = [0 diff(SynROIs(i,:))]; %find derivative
end

Syn_dFdT = transpose(Syn_dFdT); %redo-transpose b/c lazy
end
