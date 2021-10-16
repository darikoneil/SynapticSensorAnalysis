function [write_file] = csv2excel(cellID,Indicator)

%MBL NEURO TEAM HOPPA JACKIE & DARIK CODE


folderID = uigetdir();
read_file = dir(strcat(folderID,'\analysis\*.csv'));  %Read each file in directory that has "csv"
write_file = strcat(folderID,'\cell', cellID, '_', Indicator,'.xlsx');

for i = 1:length(read_file)

    dat = readtable(strcat(read_file(i).folder,'\',read_file(i).name));
    sheet = erase(read_file(i).name,'.csv');
    writetable(dat,write_file,"Sheet",sheet)

end

end







