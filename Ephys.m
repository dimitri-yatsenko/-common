%{
common.Ephys (imported) # my newest table
->common.Recording
-----
#start_time: double #timestamp of start in nanoseconds neuralynx format
%}

classdef Ephys < dj.Relvar & dj.AutoPopulate
    
    properties
        popRel=common.Recording
    end
    
    methods(Access=protected)
        
        function makeTuples(self, key)
           % tuple=key;
           % tuple.start_time=randn(1);
           % self.insert(tuple);
           self.insert(key)
            for key=fetch(common.Recording&key)';
                recording_type=fetchn(common.Recording&key,...
                    'rectype_id');
                %based on type of recording (sharps vs tetrode), pull up
                %correct data loading method
                
                if recording_type==1 %intracellular
                    makeTuples(common.VoltageTrace,key);
                else
                    makeTuples(common.Spikes,key);
                end
                
            end
        end
        
    end
end
