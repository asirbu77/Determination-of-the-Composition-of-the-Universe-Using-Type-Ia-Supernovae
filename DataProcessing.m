opts = delimitedTextImportOptions('Delimiter', ' & '); % Specify delimiter
data = readmatrix('SNeDat.txt', opts); % Import raw data

% =============================
% Process and export full data
% =============================

% Declare processed data to be [z mB]
proDat = [data(:,2) data(:,3)];
deleteList = []; % List of rows to remove due to \nodata
j = 1; % Counter for deleteList index
for i=1:length(proDat)
    if contains(proDat(i,2), 'no')
        deleteList(j) = i;
        j = j + 1;
    else % If row has valid data, split its uncertainty into third column
        splitUnc = split(proDat(i,2), '(');
        splitUnc(2,1) = strip(splitUnc(2,1),')');
        proDat(i,2:3) = splitUnc;
    end
end
proDat(deleteList,:) = []; % Delete the \nodata rows
proDat = str2double(proDat); % Convert data to doubles
proDat = sortrows(proDat); % Sort data by increasing z
writematrix(proDat, 'proDat.csv'); % Export processed data

% =================================
% Process and export z <= 0.1 data
% =================================
 
lowzArr = proDat(proDat(:,1) <= 0.1, :); % Matrix containing only z <=1
writematrix(lowzArr, 'lowzArr.csv');



        
        
