% this script takes in the path for an intracellular recording, in response
% to a particular stimulus, and outputs the raw voltage trace
function [Samples_DC1]=load_ephys(recording_path)
currentfile = [recording_path,'\', 'DC1.ncs'];
after_G84=0; 

%%%%%load header and get sampling rates, then load samples
[NlxHeader] = Import_Get_Header_CSC(currentfile);
[Timestamp,SampleFrequency,Samples] = importCSC_wo_header(currentfile);   

AD_BitVolts_num=4.00012e-006;
Samples = Samples*AD_BitVolts_num; %rescale samples to look like it does in dataviewer 

%%%%get timestamps
timestamps_size = length(Timestamp); %Timestamp variable is a list of timestamps for every 512 samples
interval = (Timestamp(timestamps_size-1)-Timestamp(2))/(timestamps_size - 1 - 2);
i = 0:1:(timestamps_size - 1);
difference = i*interval - Timestamp + Timestamp(1);
%Compares the calculated timestamp values (based on the beginning timestamp,
%and the 512*interval, and compares it with actual timestamps
%This allows all timestamps to be expressed as two numbers -- the initial timestamp, and the interval of each sample
unique(difference);
Downsampled_DC1 = round (interval / (512*30.7200));  %1 means it wasn't downsampled
                     
Timestamp = Timestamp(1,1);
File_Info.Timestamp_DC1=Timestamp;
interval = interval/512;  %because the intervals are computed at every 512 samples %% big change, will probabaly affect other programs

renvar Timestamp Timestamp_DC1
renvar Samples Samples_DC1
renvar NlxHeader NlxHeader_DC1
renvar interval Interval_DC1

File_Info.Interval_DC1=Interval_DC1;
%now fix scaling of DC1
if after_G84 == 0 % for G84 and before
Samples_DC1 =  Samples_DC1*0.8782674*1e3; 
Samples_DC1=Samples_DC1(:);
File_Info.ScalingFactorUsed  = 'adbitvolt*0.8782674*1e3';

removespikes2
%close all
%% reduce sampling rate
%%%%reduce V1 sampling rate 10 10K from 32 K
Samples_DC1_filtered = conv(ones(1,5)*1/5,Samples_DC1(:));
i = 5+round(1e2/Interval_DC1*[0:1:floor(  (length(Samples_DC1_filtered (:))-5)  *Interval_DC1/1e2)]);
Samples_DC1_10khz(1:length(i)) = Samples_DC1_filtered(i); 
clear Samples_DC1_filtered

x = Timestamp_DC1:Interval_DC1:Timestamp_DC1+(length(Samples_DC1(:))-1)*Interval_DC1;
xi = Timestamp_DC1 + (i(1) - 3 )*Interval_DC1  :1e2:Timestamp_DC1+(length(Samples_DC1(:))-5)*Interval_DC1;

clear i
clear x Samples_DC1;

%Events_Block1 = Events(1,1);
%xi = xi - Events_Block1 ;
%Events = Events - Events_Block1 ;

Samples_DC1 = Samples_DC1_10khz;
clear Samples_DC1_10khz
time_DC1=xi;
clear x

%low pass filter

%low pass filter
FS=10000;
Wn=3/(FS/2);
[b,a] = butter(5, Wn, 'high');
DC1_low = filtfilt(b, a, Samples_DC1);
figure; plot(Samples_DC1,'r'); hold on; plot(DC1_low);

end