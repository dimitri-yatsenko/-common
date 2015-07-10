% this script takes in the path for an extracellular recording, in response
% to a particular stimulus, and outputs the times of sorted spikes from all
% cells on all tetrodes
function [spike_times]=load_spikes(recording_path)
%now read in spike-sorted cells
[spike_times, TTsummary, TT_info] = FormatTTs(recording_path); %this gets you the spike-times for all TT files
spike_times(spike_times(:) ~= 0) = spike_times(spike_times(:) ~=0) - 1300;
return