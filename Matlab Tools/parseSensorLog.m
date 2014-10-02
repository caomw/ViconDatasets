function [] = parseSensorLog(fname, sync_start, crop_length)

    sensorLog = dlmread(fname, ',', 1, 0);
    s = sync_start;
    e = size(sensorLog,1);
    
    if (crop_length > 0)
       e = s + crop_length; 
    end

%   Raw Data
    ts = sensorLog(s:e, 1)';
    acc = sensorLog(s:e, 2:4)';
    gyro = sensorLog(s:e, 5:7)';
    mag = sensorLog(s:e, 8:10)';
    
%   Device Motion Data
    DM_grav = sensorLog(s:e, 11:13)';
    DM_usrAcc = sensorLog(s:e, 14:16)';
    DM_mag = sensorLog(s:e, 17:19)';
    DM_Q = sensorLog(s:e, 20:23)';
    
    save sensorData.mat ts acc gyro mag DM_usrAcc DM_grav DM_mag DM_Q
    
end
