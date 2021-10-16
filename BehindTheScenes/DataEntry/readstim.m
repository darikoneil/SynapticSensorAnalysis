function [conditions, indices, times] = readstim(timerecording) 

    % check stim file can be read into matrix
    try
        
        celln = load(timerecording);
        celldat = struct2cell(celln);
        dat = celldat{1};
        matrixdim = size(dat);
        
        for i = 1:matrixdim(2)
            conditions(i) = dat(1,i); %read out conditions used (length of array = # conditions)
        end
        conditions = conditions';
        for j = 1:matrixdim(2)
            for i = 1:matrixdim(1)-1 %parse index and time here
                indices(j,i)=i*j;
                dumtime = dat{i+1,j};
                dumtime = strsplit(dumtime,':');
                min = str2num(dumtime{1});
                sec = str2num(dumtime{2});
                tot_sec = 60*min+sec;
                times(j,i)=tot_sec;                
            end
        end
        
    catch
        warning('should be mat file: each column is condition with time files underneath');
    end

end