function [] = plotViconData(ViconDataName, vidPath, dt)

    fid = figure;
    
    Data = dlmread(ViconDataName, ',', 11, 0);
    r = VideoReader(vidPath);
   
    for i=1:length(Data)
        clf;
        axis image
        axis([-500 1000 -500 1000 -200 1000])
        view(30, 25)
        axis vis3d
        box on
        camproj perspective
        
        hold on
        plot3(Data(i,2),Data(i,3),Data(i,4),'ko')
        plot3(Data(i,5),Data(i,6),Data(i,7),'ko')
        plot3(Data(i,8),Data(i,9),Data(i,10),'ko')
        plot3(Data(i,11),Data(i,12),Data(i,13),'ko')
        plot3(Data(i,14),Data(i,15),Data(i,16),'rx')
        plot3(Data(i,17),Data(i,18),Data(i,19),'bx')
        plot3(Data(i,20),Data(i,21),Data(i,22),'gx')
        plot3(Data(i,23),Data(i,24),Data(i,25),'mx')
        
        tl = Data(i,14:16)';
        bl = Data(i,17:19)';
        tr = Data(i,20:22)';
        br = Data(i,23:25)';
        
        [x,y,z,s] = lh_makeAxes(tl, bl, tr, br);

        frame = rgb2gray(read(r, ceil(i/4)));
        
        imsurf(frame, bl, z, x, s);colormap('gray')
        
        hold off
        drawnow;
        pause(dt);
    end

end
