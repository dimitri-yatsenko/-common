%{
common.RecordingType (lookup) # my newest table
rectype_id      : smallint               # numeric id
---
rectype_name                : varchar(20)                   # Intra, Extra
%}


classdef RecordingType < dj.Relvar
end