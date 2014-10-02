function A = lh_TRIAD(y_b, x_b, y_w, x_w)

    x_b = x_b./norm(x_b);
    x_w = x_w./norm(x_w);
    y_b = y_b./norm(y_b);
    y_w = y_w./norm(y_w);

    r1 = x_b;
    r2 = cross(x_b, y_b);
    r2 = r2./norm(r2);
    r3 = cross(r1, r2);
    r3 = r3./norm(r3);
    
    s1 = x_w;
    s2 = cross(x_w, y_w);
    s2 = s2./norm(s2);
    s3 = cross(s1, s2);
    s3 = s3./norm(s3);
     
    A = [s1 s2 s3]*[r1 r2 r3]';
    
end


