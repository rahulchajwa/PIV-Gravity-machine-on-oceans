%%Getting track000.csv files

%Run this in the source folder
clearvars
D = dir;
for ii=3:length(D)
Folder{ii} = sprintf(D(ii).name);
end

%Run this in the destination folder
DD = dir;
s1 = DD(1).folder;
for ii=3:length(DD)
FolderDes{ii} = sprintf(DD(ii).name);
end

%Run this again in source folder
for ii=3:length(DD)
%for ii=6:length(D)
if exist(FolderDes{ii}, 'dir')
cd(FolderDes{ii});
if exist('track000.csv') ==2
copyfile('track000.csv',strcat(s1,'/',FolderDes{ii}))
end
cd ..
end
end