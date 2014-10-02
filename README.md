README:

Sampling frequencies are:

Vicon: 120Hz
iOS Sensors: ~ 60Hz (seems to be around 63HZ on average)
iOS Camera: ~ 30Hz (Just under normally ~ 29Hz)

Note that the iOS DM_Q is the Device Motion Quaternion and is measured within the Z Up and arbitary X reference frame. 
For Synchronization I made the Q at the offset the origin, and everything from there on is relative.

The synchronization points in the iOS datasets are at the following indices:

These offsets are what are required to get the iOS Quaternion measurements to match with the Vicon Quaternions.
These are the offsets to begin reading data from in the sensorFile, such that a down sampled version of the Vicon data
(downsampled by 2) overlappes correctly with the sensorData.

1: 368
2: 637
3: 422
4: 296  --- Vicon data is invalid until index - 93 (Not really invalid but it is easier to cut it off then change my code)
5: 542
6: 428  --- Vicon data is invalid until index - 236 (Not really invalid but it is easier to cut it off then change my code)
7: 272
8: 393
9: 226
10: 228

The calibrated magnetometer data did not record correctly, so we obtain it by subtracting using the Vicon data or the Raw iOS data.

The Vicon dataset is split into 4 world reference points and 4 markers on the phone. The labels are as such:

World:
W1: 2,3,4
W2: 5,6,7
W3: 8,9,10
W4: 11,12,13

Phone:
Top Left: 14(x) 15(y) 16(z)
Bottom Left: 17(x) 18(y) 19(z)
Top Right: 20(x) 21(y) 22(z)
Bottom Right: 23(x) 24(y) 25(z)
