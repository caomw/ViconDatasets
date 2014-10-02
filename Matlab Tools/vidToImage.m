function [mov] = vidToImage(vidPath, everyNframes, outName, fmt)

r = VideoReader(vidPath)

nframes = get(r,'NumberOfFrames');
w = get(r,'Width');
h = get(r,'Height');

mov(1) = struct('cdata', zeros(h, w, 3, 'uint8'), ...
'colormap', []);

for k = 0 : round((nframes-1)/everyNframes)
    mov(1).cdata = read(r, k*everyNframes+1);
    
    t = sprintf('%s%d.%s',outName,k,fmt);
    imwrite(mov(1).cdata,t,fmt);
end

end