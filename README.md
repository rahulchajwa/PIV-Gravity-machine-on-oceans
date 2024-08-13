# Particle Imaging Velocimetry in Noisy Environments
This is a set of codes for analysing the data from the Gravity machine [Krishnamurthy, D., Li, H., Benoit du Rey, F. et al. Scale-free vertical tracking microscopy. Nat Methods 17, 1040–1051 (2020). https://doi.org/10.1038/s41592-020-0924-7] on a ship. The low frequency noise is eliminated using a two-axis gimbal. For an example dataset see: Chajwa, Rahul et al. (2024). Hidden comet-tails of marine snow impede ocean-based carbon sequestration [Dataset]. Dryad. https://doi.org/10.5061/dryad.v15dv4253

run automating_PIV_folders.m to create a copy of the data for analysis as a directory with a chose file structure
run transfer_tracks.m to copy the .csv file of the GM tracks to these folders

Raw_Sedimentation_PIV_data directory contains various folders with folder name indicating dates of data collection. Each of these folder further consists of subfolders with GM data for individual aggregate tracks. These subfolders contains the following: 

>> input_raw contains raw images from the GM acquisition. 

>> output_processed contains frames after basic contrast enhancement through ImageJ. 

>> registered_output contains frames after image registration step to remove high frequency background noise. This folder also contains the PIV analysis .mat file.

 >> track.csv contains the tracking data from the GM

Basic Shape-Velocity analysis:
The code shape_velo_automate gives the (size, structure, velocity) map of the data. The structure can be chosen to be the fractal dimension.

For PIV there are two parts to the code:
1) Image registration to remove high-frequency noise

input raw with background noise
![input_raw-ezgif com-optimize](https://github.com/user-attachments/assets/72a7280b-adaa-4e1e-a690-2cdc9df6ea3c)

registered output for PIV analysis
![registered_output-ezgif com-optimize](https://github.com/user-attachments/assets/38038217-0eb7-49be-bebe-b9a2777389a0)

Note that after image registration the particle appears completely tethered.

2) PIV batch processing: download the PIVlab from: https://www.mathworks.com/matlabcentral/fileexchange/27659-pivlab-particle-image-velocimetry-piv-tool-with-gui and paste the automating_PIVlab.m and Getting_data_structure.m in PIVlab folder. Run Getting_data_structure.m followed by automating_PIVlab.m.

The flow field from the above image (the yellow region is zero velocity, with white streamlines)
![flow_field](https://github.com/user-attachments/assets/177beb40-6774-4842-a614-4dbc2df55b51)




These codes were used in a recent preprint: R. Chajwa et al. Hidden comet-tails of Marine snow Impede Ocean based Carbon Sequestration (2023) https://doi.org/10.48550/arXiv.2310.01982 
