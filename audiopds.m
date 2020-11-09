clc all; close all; clear all;

tic
[data, Fs] = audioread('audio1.wav')
T = 1 / Fs; 
N = length(data);
fp = Fs * [0:N-1]/N;
t = [0:N-1]' * T;    

y = fft (data);
y = fftshift (y);
y = abs (y);
ny = y/max(y);

toc
figure (1);
subplot (211);
plot (t, data);
title ('Audio');
xlabel ('Tiempo (s)')
grid;

subplot (212);
plot (fp(1:N/2), ny(N/2:end - 1));  
title ('x[n]');
xlabel ('Frecuencia (Hz)')
grid;
