%% Run this script in the data source folder before running the PIV automation pipeline

clearvars; currentDir = pwd;
D = dir;
% getting the labels of all folders and subfolders
for ii=3:length(D) %note that the first two elements in the directory are garbage
Folder{ii} = sprintf(D(ii).name);
cd(D(ii).name);
DD = dir;
DL(ii-2) = length(DD)-2;
for jj=3:length(DD)
ParentFolder{ii,jj} = sprintf(DD(jj).folder);
SubFolder{ii,jj} = strcat(DD(jj).folder,'/',DD(jj).name);
%cd(SubFolder{ii,jj});
%cd('registered_output');
%a = dir('*.tif');
end
cd ..
clearvars DD
end
