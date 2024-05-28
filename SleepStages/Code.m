clc;
clear;
close all;
%% load EEG data
load('SC4001E0-PSG_edfm.mat');

%% plot raw EEG
fs=100;
times=(1:length(val))/fs;
figure;
subplot(2,1,1);
plot(times,val);
title('EEG');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);
ylim([-2000,2000])

%% plot_filtered data
data=padarray(val,[1,38*fs],0);
EEG_filtered = eegfilt(data(2,:),fs,0.1,40,0,floor(fs/0.1)*3,0,'fir1');
EEG_filtered=EEG_filtered(6001:12000);
t=(1:6000)/fs;
subplot(2,1,2);
plot(t,EEG_filtered);
title('Filtered EEG');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);
ylim([-2000,2000])

%% Normalizing data
normal_val=val/max(val);
figure;
plot(times,normal_val);
title('EEG after normalization');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);

%% FFT
nFFT =2^nextpow2(length(val));
y=fft(val,nFFT);
x=1:nFFT;
figure;
plot(x,y);
title('FFT');
xlabel('Frequency(Hz)');
xlim([0 98])

%% delta band 
DELTA_Frequency = eegfilt(data(2,:),fs,0.5,4);
DELTA_Frequency = DELTA_Frequency(6001:12000);
t=(1:length(DELTA_Frequency))/fs;
figure
subplot(5,1,1)
plot(t,DELTA_Frequency);
title('Delta band');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);

%% teta band
Teta_Frequency = eegfilt(data(2,:),fs,4,8,0,floor(fs/4)*3,0,'fir1');
Teta_Frequency=Teta_Frequency(6001:12000);
t=(1:length(Teta_Frequency))/fs;
subplot(5,1,2)
plot(t,Teta_Frequency);
title('Teta band');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);

%% alph band
Alpha_Frequency = eegfilt(data(2,:),fs,8,13,0,floor(fs/8)*3,0,'fir1');
Alpha_Frequency=Alpha_Frequency(6001:12000);
t=(1:length(Alpha_Frequency))/fs;
subplot(5,1,3)
plot(t,Alpha_Frequency);
title('Alpha band');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);

%% beta band
Beta_Frequency = eegfilt(data(2,:),fs,13,30,0,floor(fs/13)*3,0,'fir1');
Beta_Frequency=Beta_Frequency(6001:12000);
t=(1:length(Beta_Frequency))/fs;
subplot(5,1,4);
plot(t,Beta_Frequency);
title('Beta band');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);

%% gama band
Gama_Frequency = eegfilt(data(2,:),fs,30,40,0,floor(fs/30)*3,0,'fir1');
Gama_Frequency=Gama_Frequency(6001:12000);
t=(1:length(Gama_Frequency))/fs;
subplot(5,1,5);
plot(t,Gama_Frequency);
title('Gama band ');
xlabel('Time(s)');
ylabel('Amp (uV)');
xlim([0 10]);
