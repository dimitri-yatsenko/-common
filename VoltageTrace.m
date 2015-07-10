%{
common.VoltageTrace (imported) # my newest table
->common.Ephys
-----
voltage_trace: longblob #Vm in uV
dt: double #sampling period in ms
%}

classdef VoltageTrace < dj.Relvar
    methods
        
        function makeTuples(self, key)
            recording_path=fetch1(common.Recording&key,...
                'recording_path');
            key.voltage_trace= load_ephys(recording_path);
            key.dt=rand(1);
            self.insert(key)
        end
    end
end