Data_Dir = 'Frame_Data/';
frameData = {};

for i = 1:801
    fr = dlmread(sprintf('%sframe%u.txt',Data_Dir,i-1),' ',0,0);
    fr = reshape(fr, 480,640)'./255;
    
    frameData{i}.img = fr;
    
    crns = detectMinEigenFeatures(fr,'MinQuality',0.02);
    
    frameData{i}.fpts = double( floor(crns.Location) );
end

save framesAndFpts frameData