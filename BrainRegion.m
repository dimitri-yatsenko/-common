%{
common.BrainRegion (lookup) # my newest table
region_id       : smallint               # 
---
region_name                 : varchar(20)           #Thalamus,Cortex
%}


classdef BrainRegion < dj.Relvar
end