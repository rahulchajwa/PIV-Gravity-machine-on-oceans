%%this code sequentially goes through the data and prompts the user to select the region of interest (red box) for shape analysis
currentDir = pwd; 
D = dir; %list of subfolders
 l =1;
for ii=3:length(D)
%for ii=6:length(D)
cd(D(ii).name);

cd('DF1');

cd('00000')

a = dir('*.tif');
nn = numel(a);
if nn>0
lis = 1:1:nn;
flname = sprintf(a(lis(3)).name);
I = imread(flname);
f1 = figure('Units','normalized')
imshow(I);
r1 = drawrectangle('Color',[1 0 0]);
I3= imcrop(I,r1.Position);
I2 = im2bw(I3,0.5); %thresholding
I5 = bwareaopen(I2, 500);                 %shape props
I4 = bwperim(I5,8);

%f1 = figure('Units','normalized')
%imshow(I2)
%r1 = drawrectangle('Color',[1 0 0]);
%I3= imcrop(I2,r1.Position);
%I5 = bwareaopen(I3, 500);                 %shape props
%I4 = bwperim(I5,8);
%imshowpair(I3,I4,'montage'); %do not display
stats = regionprops(I5,'Circularity');
frac(l) = hausDim(I5);
sz(l) = sqrt((bwarea(I5)*0.828*0.828*10^-8)/pi); %equivalent circle in cm^2
close(f1)
cd ..

cd ..

Flist = dir('track*.csv'); %list only data files
n=length(Flist);
m=0;
for jj=1:n
m=m+1;
X=readtable(Flist(n).name);
%plot(X.Time(:,1)-X.Time(1,1),X.Z_objStage(:,1)-X.Z_objStage(1,1),'-'); hold on
[f,gof,out]=fit(X.Time(:,1)-X.Time(1,1),X.Z_objStage(:,1)-X.Z_objStage(1,1),'poly1');
v_temp(m) = f.p1;
v_err(m) = gof.rmse;
end
v(l) = mean(v_temp);
verr(l) = mean(v_err);
%clearvars X
clearvars n lis

end
cd ..

l = l+1;

end

%scatter3(frac,sz,v,'o')
