%{
common.EphysStats (computed) # my newest table
->common.VoltageTrace
-----
mean: double
std: double 
%}

classdef EphysStats < dj.Relvar & dj.AutoPopulate

	properties
		popRel=common.VoltageTrace; 
	end

	methods(Access=protected)

		function makeTuples(self, key)
            v=fetch1(common.VoltageTrace&key);
            key.mean=mean(v);
            key.std=std(v);
            pause(30);
			self.insert(key)
		end
	end

end