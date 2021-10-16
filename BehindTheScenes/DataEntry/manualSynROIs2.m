function [SynROIs] = manualSynROIs2(dataset)

%Darik O'Neil MBL Neuro 2021 Team Hoppa

SynTable = dataset(1:end,(1:(end-2))); %DROP AVG/ERROR & Headers

SynROIs = SynTable; %export

end


