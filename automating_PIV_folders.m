currentDir = pwd; 
D = dir;

for ii=3:length(D)
%for ii=6:length(D)
Folder{ii} = sprintf(D(ii).name);
cd(D(ii).name);
DD = dir;
DL(ii-2) = length(DD)-2;
for jj=3:length(DD)
  SubFolder{ii,jj} = sprintf(DD(jj).name);
end
cd ..
clearvars DD
end

cd .. 

cd('data_analysis');

for ii=3:length(D)
mkdir(Folder{ii})
cd(Folder{ii});
for jj=3:DL(ii-2)+2
  mkdir(SubFolder{ii,jj});
  cd(SubFolder{ii,jj})
  mkdir('input_raw');
  cd('input_raw');
  DD = dir;
  SubFolderDes{ii,jj} = sprintf(DD(1).folder); 
  cd ..
  clearvars DD
  mkdir('registered_output');
  mkdir('output_processed');
  cd ..
end
cd ..
end
cd ..
cd('data')

for ii=3:length(D)
Folder{ii} = sprintf(D(ii).name);
cd(D(ii).name);
DD = dir;
DL(ii-2) = length(DD)-2;
for jj=3:length(DD)
  SubFolder{ii,jj} = sprintf(DD(jj).name);
  cd(SubFolder{ii,jj});
  cd('DF1');
  b = dir; %to check if 00000 exists or not
  if(length(b)>2)
  cd('00000')
  a = dir('*.tif');
  if(~isempty(a) && length(a)>=21)
    n_initial = floor(length(a)/2);
    m=1;
    for i=n_initial:1:n_initial+10
        copyfile(a(i).name,SubFolderDes{ii,jj})
        m=m+1;
    end
  end
  clearvars a m
  cd .. 
  end
  clearvars b
  cd ..
  cd ..
end
cd ..
clearvars DD
end
