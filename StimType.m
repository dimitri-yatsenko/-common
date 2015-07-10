%{
common.StimType (lookup) # my newest table
stim_id         : smallint               # numeric id
---
stim_name                   : varchar(20)                   # LPFN, ORT, Allbars, etc
%}


classdef StimType < dj.Relvar
end