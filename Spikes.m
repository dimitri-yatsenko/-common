%{
common.Spikes (imported) # my newest table
-> common.Ephys
---
spike_times                 : longblob                      # a big matrix of spike times
%}


classdef Spikes < dj.Relvar 
    
   methods 
        function makeTuples(self, key)
            recording_path=fetch1(common.Recording&key,...
                'recording_path');
            key.spike_times= load_spikes(recording_path);
            self.insert(key)
        end
    end
    
end