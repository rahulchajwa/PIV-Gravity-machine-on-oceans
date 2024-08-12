%see the dryrad dataset for the file structure used https://doi.org/10.5061/dryad.v15dv4253
% the code takes image files in .tif format in the output_processed folders to create registered images in the folder registered_output
%these registered images has filtered high frequency temporal noise and serve as an input to the PIV pipeline

currentDir = pwd; 
D = dir;

% getting the labels of all folders and subfolders
for ii=3:length(D)
Folder{ii} = sprintf(D(ii).name);
cd(D(ii).name);
DD = dir;
DL(ii-2) = length(DD)-2;
for jj=3:length(DD)
  SubFolder{ii,jj} = sprintf(DD(jj).name);
  cd(SubFolder{ii,jj});
  cd('output_processed');
  a = dir('*.tif');
  
  I = imread(a(1).name); BW = imbinarize(I);
  BW2 = imfill(BW,'holes');
  I1 = medfilt2(BW2);
  I5 = bwareaopen(I1, 500);
  fixed = immultiply(I1,I);
  
  [optimizer,metric] = imregconfig("monomodal");
  
  for i=1:length(a)
  moving{i} = imread(a(i).name);
  movingRegistered{i} = imregister(moving{i},fixed,"translation",optimizer,metric);
  end
  
  cd ..
  cd('registered_output');

  for i=1:length(a)
  imwrite(movingRegistered{i},a(i).name);
  end
  

  clearvars a registered_output
  cd ..
  cd ..
end
cd ..
clearvars DD
end

% Image registration step
function [movingRegistered] = Translate_to_align(fixed,moving)
[optimizer,metric] = imregconfig("monomodal");
movingRegistered = imregister(moving,fixed,"translation",optimizer,metric);
%imshowpair(fixed,movingRegistered,'montage')
end
