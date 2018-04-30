function [ recorder1 ] = record( sampleRate, bitDepth, length, message)
%RECORD creates an audio recording 
    msgbox([message  ': a '  num2str(length) ' second recording is about to start'])
    recorder1 = audiorecorder(sampleRate, bitDepth, 1);
    recordblocking(recorder1, length)
end

