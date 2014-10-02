iOSFrames = {};

for k=0:800
   fname = sprintf('frame%u.txt',k);
   fptsName = sprintf('frame%u.txt',k);
   
   Img = dlmread(fname,' ');
   fpts = dlmread(fptsName,',');
   
   frame = [];

   for i = 1:640
        for j = 1:480
            frame(i,j) = Img( (i-1)*480 + j);
        end
   end
  
   fpts = unique(fpts,'rows');
       
   iOSFrames{k+1}.I = frame;
   iOSFrames{k+1}.fpts = fpts';
end