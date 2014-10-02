function [mean_ts, sd_ts, dts] = iosSamplingStability(ts)
    dts = [];

    for i = 2:length(ts)
       dts(i-1) = ts(i) - ts(i-1);
    end
    
    mean_ts = mean(dts);
    sd_ts = std(dts);

    plot(1./dts);
%     hold on;
%     plot(repmat(mean_ts, 1, length(dts)), 'r');
%     plot(repmat(mean_ts + sd_ts, 1, length(dts)), 'g--');
%     plot(repmat(mean_ts - sd_ts, 1, length(dts)), 'g--');
%     hold off;

end