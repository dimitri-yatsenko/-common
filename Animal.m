%{
tc.Animal (manual) # my newest table
animal_id:char(3)   # Name of Cat using Letter:## format
-----
card_id:char(12)    # ID number assigned on Cage Card
dos:date            #Date of implant
comment: varchar(1000) #Free-hand comment, max 1000 char
%}

classdef Animal < dj.Relvar
end