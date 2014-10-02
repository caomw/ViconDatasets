function [x,y,z,s] = lh_makeAxes(tl, bl, tr, br) 
    y = (tl-bl)./norm(tl-bl);
    x = (br-bl)./norm(br-bl);
    z = cross(y,x);
    z= z./norm(z);
    
    s = norm(tl-bl)/640;
end