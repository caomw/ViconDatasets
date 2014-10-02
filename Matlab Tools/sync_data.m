function [iosSyncPoint] = sync_data(ViconDataName, iosSyncPoint)

    parseSensorLog('sensorLog.csv', 1, 0);
    load('sensorData.mat');

%   Find when gravity is aligned to z
    I = find(DM_grav(3,:) == max(DM_grav(3,:)));
    
    if (iosSyncPoint > 0)
        I = iosSyncPoint;
    end

    iosSyncPoint = I;

%   Crop the sensorData
    parseSensorLog('sensorLog.csv', I(1), 0);
    load('sensorData.mat');

    Data = dlmread(ViconDataName, ',', 11, 0);
    [Rs, tv] = getViconRotations(Data, 1);

    Q = [];
    Ev = [];
    for i = 1:length(Rs)
        Q(:,i) = mat2q(Rs(:,:,i));
    end
    Q(1,:) = -Q(1,:);
    
%   Downsmaple the Vicom rotations by 2 as they were collected at 120Hz
    Q2 = Q(:,1:2:end); 
    Q2 = resample(Q',63,120)';

    DM_Qr = [];
    E = [];
    for i = 1:min(length(DM_Q),length(Q2))
        k = i;
        DM_Qr(:,k) = quaternionMultiply(quaternionInverse(DM_Q(:,1)), DM_Q(:,i));
        
        [p,r,y] = quaternion2Euler(DM_Qr(:,k));
        E(:,k) = [p;r;y];

        [p,r,y] = quaternion2Euler(Q2(:,i));
        Ev(:,i) = [p;r;y];
    end
    
    figure
    plot((Q2'));hold on;plot((DM_Qr'),'k--');
    Vicon_Q = Q;
    Vicon_t = tv;
    figure; plot(Ev');hold on;plot(E','k--');

    save syncedData.mat DM_Qr Vicon_Q Vicon_t iosSyncPoint

end