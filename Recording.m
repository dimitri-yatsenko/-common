%{
common.Recording (manual) # the recording in each folder for each cat
->common.Session
recording_id: smallint      #the subfolder number
-----
recording_path="E:\\cats": varchar(255) #path for recording
->common.RecordingType
->common.BrainRegion
->common.StimType

%}

classdef Recording < dj.Relvar
end