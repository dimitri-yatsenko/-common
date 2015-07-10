%{
tc.Session (manual) # my newest table
->tc.Animal
session_id:char(3)   # Name of Cat using Letter:## format
folder_path:varchar(255) 
-----
%}

classdef Session < dj.Relvar
end