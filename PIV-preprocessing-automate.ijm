//dir = "/Users/rahulchajwa/Documents/Maine-PIV/20210616-marineSnow";
dirparent = "/media/rahul/My Passport/RV-endeavor/gravity_machine_data_fromSchistoGM_saved20210621/PIV_data_analysis";
listparent = getFileList(dirparent);

for(j=0; j < listparent.length; j++)
{

dir = dirparent + "/" + listparent[j];

list = getFileList(dir);

for (i = 0; i < list.length; i++) 
{
print("Processing ... ", list[i]);
path1 = dir + "/" + list[i] + "input_raw";
path2 = dir + "/" + list[i] + "output_processed";

imagelist = getFileList(path1);
for (k = 0; k < imagelist.length; k++) 
{
	//print(imagelist[k]);
	imagepath = path1 + "/" + imagelist[k];
     open(imagepath);
     run("Brightness/Contrast...");
     setMinAndMax(28, 283);
     run("Apply LUT");
     saveAs("Tiff", path2 + "/" +  imagelist[k] );
     close();
     
}



//print(path1);
//print(path2);

//processFile(path1,path2,imagelist);
}

}