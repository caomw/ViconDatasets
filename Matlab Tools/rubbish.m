e = [];
Q = [];
Ev = [];
for i = 1:length(Rs)
    Q(:,i) = mat2q(Rs(:,:,i));
    [p,r,y] = quaternion2Euler(Q(:,i));
    Ev(:,k) = [p;r;y];
end

DM_Qr = [];
start = 1;
E = [];

for i = start:length(DM_Q)
    k = i - start + 1;
    DM_Qr(:,k) = (quaternionMultiply(quaternionInverse(DM_Q(:,start)) , DM_Q(:,i) ));
    [p,r,y] = quaternion2Euler(DM_Qr(:,k));
    E(:,k) = [p;r;y];
end

dts = [];

for i = 2:length(ts)
   dts(i-1) = ts(i) - ts(i-1);
end

e=[];
for i=1:length(DM_Qr)
   e(i) = quaternionSimilarity(DM_Qr(:,i), Vicon_Q(:,(i-1)*2+1));
end