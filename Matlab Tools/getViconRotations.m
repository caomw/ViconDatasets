function [Rs, t, xx] = getViconRotations(Data, ref)

    y_w = [];
    x_w = [];
    t0 = [];
    
    Rs = [];
    t = [];
    xx=[];

    for i = ref:length(Data)
        tl = Data(i,14:16)';
        bl = Data(i,17:19)';
        tr = Data(i,20:22)';
        br = Data(i,23:25)';

        [x,y,z,s] = lh_makeAxes(tl, bl, tr, br); 
        xx(:,i) = [x;z];
        if (i == ref)
           y_w = y;
           x_w = x;
           t0 = tr;
        end
        
        j = i - ref + 1;
        Rs(:,:,j) = lh_TRIAD(y, x, y_w, x_w);
        t(:,j) = tr - t0;
    end

end