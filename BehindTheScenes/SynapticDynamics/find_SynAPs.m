function [SynAPL, SynAPP, SynFWHM, SynAPK, SynMini] = find_SynAPs(SynROIs)

%Darik O'Neil MBL Neuro 2021 Team Hoppa

numSyn = size(SynROIs,2);
SynAPL = cell(1,numSyn);
SynAPP = cell(SynAPL);
SynFWHM = cell(SynAPL);
SynAPK=cell(SynAPL);

for i = 1:numSyn
    Mint = abs(min(SynROIs(:,i)));
    [pks,locs,w,p] = findpeaks(SynROIs(:,i),'MinPeakDistance',40,'MinPeakHeight',Mint,'WidthReference','halfheight');
    SynAPL{i}(:)=locs;
    SynAPP{i}(:) = p;
    SynFWHM{i}(:) = w;
    while pks < 3
        %pks = [pks 0]; %ruins analysis of command-line codes for syn later if left empty
        pks = [pks NaN]; %ruins analysis of command-line codes for syn later if left empty
    end
    SynAPK{i}(:) = pks;
    SynMini{i}(:) = SynAPK{i}(find(SynAPK{i}<min(maxk(SynAPK{i},3))));
end

    
end


