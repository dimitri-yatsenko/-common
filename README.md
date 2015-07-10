# -common

Second schema to test out datajoint features.

In common.Ephys and common.Spikes, I'm fetching the recording type (intracellular=Ephys or extracellular=spikes),
and using an if statement to point to a function that loads ephys data or spikes data. I'm not sure if this is a good
approach, and it doesn't seem to populate the variables as I expected.

Update: 7/10/2015
The problem seems to be with the size of the volagetrace. my.ini file holds maximum sizes for various server parameters, but changing the obvious ones didn't help.
The second issue is that the mysql error log doesn't log errors, it remains empty.
A silly problem I was having was trying to populate ephys after havng inserted manual rows into spikes and voltage_trace, which should be autopopulated. That's why I was getting a message that there was nothing to popualte.
