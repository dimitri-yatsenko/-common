# -common

Second schema to test out datajoint features.

In common.Ephys and common.Spikes, I'm fetching the recording type (intracellular=Ephys or extracellular=spikes),
and using an if statement to point to a function that loads ephys data or spikes data. I'm not sure if this is a good
approach, and it doesn't seem to populate the variables as I expected.
